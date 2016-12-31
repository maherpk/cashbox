import _ from 'lodash';
import jsonExport from 'jsonexport';
import mailgun from 'mailgun-js';
let MG = mailgun({
  apiKey: 'key-91d80031ad7a2f1133fd3fbdee7c55d5',
  domain: 'doubledip.com'
});

let Shifts = new PG.Table('shifts');
let TransItems = new PG.Table('lineitems_vista');

Meteor.methods({
  '/orm/shifts/add/': (data) => {
    let timestamp = new Date();
    return Shifts.returning(['id', 'started_at', 'properties'])
      .insert({
        started_at: timestamp,
        properties: data
      }).run()[0];
  },
  '/orm/shifts/end/': (shiftID) => {
    let timestamp = new Date();
    Shifts.update({
      ended_at: timestamp
    }).where({
      id: shiftID
    }).run();
  },
  '/orm/shifts/latest/': () => {
    return Shifts.returning(['id', 'started_at', 'ended_at'])
      .orderBy('started_at', 'desc').first();
  },
  '/orm/shifts/': () => {
    return Shifts.select('*').run();
  },

  '/orm/shifts/check-printer/': () => {
    let resp = {
      status: false,
    }
    try {
      let device = new Escpos.USB();
      let printer = new Escpos.Printer(device);

      if (printer) {
        resp.status = true;
        object = printer;
      }

      return resp
    } catch (err) {
      resp.object = err;

      return resp
    }
  },

  '/orm/shifts/shift-items/': (data) => {
    return TransItems.returning('*').where(data).orderBy('category_id').run();
  },

  '/orm/shifts/print-summary/': (data) => {
    let device = new Escpos.USB();
    let printer = new Escpos.Printer(device);
    let time = new Date().toLocaleString('en-US', {
      timeZone: 'Asia/Karachi'
    });
    let obj = {};
    let subTotal = 0;
    obj.DATE = time;
    obj.CASH = parseFloat(data.cash).toFixed(2);
    obj.CARD = parseFloat(data.card).toFixed(2);
    obj.Items = data.items;
    let stCash = "Cash Amount" + String(obj.CASH);
    let stCard = "Card Amount" + String(obj.CARD);
    let stTotal = "Total" + String(obj.CASH + obj.CARD);
    let total = (parseFloat(data.cash) + parseFloat(data.card)).toFixed(2);

    Escpos.Image.load('../web.browser/app/imgs/logo.png', function(image) {
      device.open(function() {
        printer
          .align('ct')
          .raster(image)
          .text('Emporium Mall Lahore')
          .text('GST#: 41709462')
          .font('a')
          .align('ct')
          .style('bu')
          .size(3, 3)
          .text('Shift Summary')
          .size(3, 3)
          .text(obj.DATE)
          .font('b')
          .style('normal')
          .text('_'.repeat(48))
          .size(2, 2)
          .control('LF')
          .text('Cash Amount' + ' '.repeat(48 - stCash.length) + obj.CASH)
          .text('')
          .text('Card Amount' + ' '.repeat(48 - stCard.length) + obj.CARD)
          .text('')
          .text('Total' + ' '.repeat(48 - stTotal.length) + total)
          .text('-'.repeat(48))
          .size(3, 3)
          .text('')
        _.forEach(obj.Items, (item) => {
          let iN = item.name + item.quantity + parseInt(parseFloat(item.item_total) * 0.8 * 1.16);
          let spaces = 1;
          if (iN.length < 44) {
            spaces = 44 - iN.length;
          }
          let iNSpaced = item.name + " ".repeat(spaces) + item.quantity + "  " + parseInt(parseFloat(item.item_total) * 0.8 * 1.16);
          printer
            .text(iNSpaced)
        });
        printer
          .text('')
          .text('')
          .cut()
      });
    });
  },

  '/orm/shifts/all-items-csv/': () => {
    let data = TransItems.returning('*').run();

    jsonExport(data, (err, s) => {
      console.log(s);
      let bfr = Buffer.from(s, 'utf-8');

      let name = new Date().toISOString().slice(0, new Date().toISOString().indexOf("T")).replace(/-/g, "");

      let attach = new MG.Attachment({
        data: bfr,
        filename: name + '.csv'
      });

      let emailData = {
        from: 'Mocca Emporium <noreply@doubledip.com>',
        to: 'yousuf@maher.pk',
        subject: 'Shift Summary',
        text: 'Mocca shift  summary for ' + new Date(),
        attachment: attach
      };

      MG.messages().send(emailData, (err, s) => {
        console.log(err);
        console.log(s);
      });
    });

    MG.messages().send(emailData, (s, e) => {
      console.log(s);
      console.log(e);
    });
  },
});
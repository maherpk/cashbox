import _ from 'lodash';
import jsonExport from 'jsonexport';
import mailgun from 'mailgun-js';
let MG = mailgun({
  apiKey: 'key-91d80031ad7a2f1133fd3fbdee7c55d5',
  domain: 'doubledip.com'
});

let Transaction = new PG.Table('transactions');

Meteor.methods({
  '/orm/transactions/add/': (data) => {
    return Transaction.insert(data).returning('id').run()[0];
  },
  '/orm/transactions/filter/': (params) => {
    return Transaction.select('*').where(params).run();
  },
  '/orm/transactions/range/': (start, end) => {
    start = new Date(start).toISOString();
    end = new Date(end).toISOString();
    console.log(start);
    console.log(end);
    let query = `created_at BETWEEN '${start}'::timestamp AND '${end}'::timestamp;`;
    //return Transaction.select('*').whereBetween('created_at'. start, end).run();
    return Transaction.select('*').whereRaw(query)
  },

  '/orm/transactions/print/': (data) => {

    jsonExport(data.items, (err, s) => {
      console.log(s);
      let bfr = Buffer.from(s, 'utf-8');

      let emailData = {
        from: 'Mocca Emporium <noreply@doubledip.com>',
        to: 'yousuf@maher.pk',
        subject: 'Hello',
        text: 'Testing some Mailgun awesomness!',
        attachment: bfr
      };
      MG.messages().send(emailData, (err, s) => {
        console.log(err);
        console.log(s);
      });
    });    
    
    // MG.messages().send(emailData, (s, e) => {
    //   console.log(s);
    //   console.log(e);
    // });
    
    let resp = {};
    try {
      let device = new Escpos.USB();
      let printer = new Escpos.Printer(device);
      let time = new Date().toLocaleString('en-US', {
        timeZone: 'Asia/Karachi'
      });
      let obj = {};
      let subTotal = 0;
      obj.DATE = time;
      obj.ITEMS = data.items;
      obj.SalesTax = parseFloat(data.trans.properties.tax).toFixed(2)
      obj.Discount = parseFloat(data.trans.properties.discount).toFixed(2)
      obj.Total = parseFloat(data.trans.properties.total).toFixed(2)

      Escpos.Image.load('../web.browser/app/imgs/logo.png', function(image) {

        device.open(function() {
          printer
            .align('ct')
            .raster(image)
            .text('')
            .text('')
            .font('a')
            .align('ct')
            .style('bu')
            .size(2, 2)
            .text('Purchase Invoice')
            .size(3, 3)
            .text(obj.DATE)
            .font('b')
            .style('normal')
            .text('_'.repeat(48))
            .size(1, 1)
          let head = 'NAME' + 'QTY' + ' '.repeat(3) + 'PRICE';
          printer
            .text('NAME' + ' '.repeat(48 - head.length) + 'QTY' + ' '.repeat(3) + 'PRICE')
            .text('='.repeat(48))
          _.forEach(obj.ITEMS, (item) => {
            let string = item.Quantity + " ".repeat(4 - String(item.Quantity).length) + item.Name + ' '.repeat(5 - String(item.Price).length) + item.Price + '.00';
            let length = string.length;
            if (length > 48) {
              length = 48
            };
            let spaced = item.Name + " ".repeat(48 - length) + " ".repeat(3 - String(item.Quantity).length) + item.Quantity + " ".repeat(5 - String(item.Price).length) + item.Price + '.00';
            subTotal += parseInt(item.Price);
            printer
              .align('ct')
              .text(spaced)
          });
          let sB = 'Sub Total' + subTotal + '.00';
          let sBSpaced = 'Sub Total' + ' '.repeat(48 - sB.length) + subTotal + '.00';
          printer
            .align('ct')
            .text('-'.repeat(48))
            .control('LF')
            .text(sBSpaced)
          let sT = 'Sales Tax' + obj.SalesTax;
          let sTSpaced = 'Sales Tax' + " ".repeat(48 - sT.length) + obj.SalesTax;
          printer
            .text(sTSpaced)
          let dT = 'Discount 20%' + obj.Discount;
          let dTSpaced = 'Discount 20%' + " ".repeat(48 - dT.length) + obj.Discount;
          printer
            .text(dTSpaced)
            .size(2, 2)
            .control('LF')
          let tO = 'Total' + Math.round(obj.Total);
          let tOSpaced = 'Total' + " ".repeat(48 - tO.length) + Math.round(obj.Total);
          printer
            .text(tOSpaced)
            .text('')
            .text('')
            .text('')
            .text('')
            .cut()
          resp.status = true;
          resp.message = 'success';
          return resp;
        });
      });
    } catch (err) {
      console.log(err);
      resp.status = false;
      resp.error = err
      resp.message = 'Check if Printer is connected and turned On.';
      return resp;
    }
  },

  '/orm/transactions/duplicate-print/': (data) => {
    let resp = {};
    try {
      let device = new Escpos.USB();
      let printer = new Escpos.Printer(device);
      let time = new Date().toLocaleString('en-US', {
        timeZone: 'Asia/Karachi'
      });
      let obj = {};
      let subTotal = 0;
      obj.DATE = time;
      obj.ITEMS = data.items;
      obj.SalesTax = parseFloat(data.trans.properties.tax).toFixed(2);
      obj.Discount = parseFloat(data.trans.properties.discount).toFixed(2);
      if ('cash' in data.trans.properties) {
        obj.CashIn = parseFloat(data.trans.properties.cash).toFixed(2);
      }
      if ('recp' in data.trans.properties) {
        obj.CardRecp = data.trans.properties.recp;
      }
      if ('balance' in data.trans.properties) {
        obj.Balance = Math.floor(data.trans.properties.balance);
      }
      obj.Total = parseFloat(data.trans.properties.total).toFixed(2)

      Escpos.Image.load('../web.browser/app/imgs/logo.png', function(image) {

        device.open(function() {
          printer
            .align('ct')
            .raster(image)
            .text('')
            .text('')
            .font('a')
            .align('ct')
            .style('bu')
            .size(2, 2)
            .text('DUPLICATE')
            .text('Purchase Invoice')
            .size(3, 3)
            .text(obj.DATE)
            .font('b')
            .style('normal')
            .text('_'.repeat(48))
            .size(1, 1)
          let head = 'NAME' + 'QTY' + ' '.repeat(3) + 'PRICE';
          printer
            .text('NAME' + ' '.repeat(48 - head.length) + 'QTY' + ' '.repeat(3) + 'PRICE')
            .text('='.repeat(48))
          _.forEach(obj.ITEMS, (item) => {
            let string = item.Quantity + " ".repeat(4 - String(item.Quantity).length) + item.Name + ' '.repeat(5 - String(item.Price).length) + item.Price + '.00';
            let length = string.length;
            if (length > 48) {
              length = 48
            };
            let spaced = item.Name + " ".repeat(48 - length) + " ".repeat(3 - String(item.Quantity).length) + item.Quantity + " ".repeat(5 - String(item.Price).length) + item.Price + '.00';
            subTotal += parseInt(item.Price);
            printer
              .align('ct')
              .text(spaced)
          });
          let sB = 'Sub Total' + subTotal + '.00';
          let sBSpaced = 'Sub Total' + ' '.repeat(48 - sB.length) + subTotal + '.00';
          printer
            .align('ct')
            .text('-'.repeat(48))
            .control('LF')
            .text(sBSpaced)
          let sT = 'Sales Tax 16%' + obj.SalesTax;
          let sTSpaced = 'Sales Tax 16%' + " ".repeat(48 - sT.length) + obj.SalesTax;
          printer
            .text(sTSpaced)
          let dT = 'Discount 20%' + obj.Discount;
          let dTSpaced = 'Discount 20%' + " ".repeat(48 - dT.length) + obj.Discount;
          printer
            .text(dTSpaced)
            .size(2, 2)
            .control('LF')
          let tO = 'Total' + Math.round(obj.Total);
          let tOSpaced = 'Total' + " ".repeat(48 - tO.length) + Math.round(obj.Total);
          printer
            .text(tOSpaced)

          if(obj.CashIn) {
            let cI = 'Cash Rec.' + obj.CashIn;
            let cISpaced = 'Cash Rec.'+" ".repeat(48 - cI.length) + obj.CashIn;
            printer
              .text(cISpaced)
          }

          if(obj.Balance) {
            let cB = 'Change' + obj.Balance;
            let cBSpaced = 'Change'+" ".repeat(48 - cB.length) + obj.Balance;
            printer
              .text(cBSpaced)
          }
          printer
            .text('')
            .text('')
            .text('')
            .text('')
            .cut()
          resp.status = true;
          resp.message = 'success';
          return resp;
        });
      });
    } catch (err) {
      console.log(err);
      resp.status = false;
      resp.error = err
      resp.message = 'Check if Printer is connected and turned On.';
      return resp;
    }
  },

  '/orm/transactions/kitchen/': (data) => {
    let device = new Escpos.USB();
    let printer = new Escpos.Printer(device);
    let time = new Date();
    let obj = {};
    let subTotal = 0;
    obj.DATE = time;
    obj.ITEMS = data.items;
    obj.Table = data.table;
    device.open(function() {
      printer
        .font('a')
        .align('ct')
        .style('bu')
        .size(2, 2)
        .text('Order List')
        .size(3, 3)
        .text(obj.DATE)
        .size(2, 2)
        .text('Table #')
        .size(3, 3)
        .text(obj.Table)
        .font('b')
        .style('normal')
        .text('_'.repeat(48))
        .size(1, 1)
      let head = 'NAME' + ' '.repeat(4) + 'QTY' + ' '.repeat(4);
      printer
        .text('NAME' + ' '.repeat(48 - head.length) + 'QTY')
        .text('='.repeat(48))
      _.forEach(obj.ITEMS, (item) => {
        let string = item.Quantity + " ".repeat(4 - String(item.Quantity).length) + item.Name;
        let spaced = item.Name + " ".repeat(48 - string.length) + " ".repeat(3 - String(item.Quantity).length) + item.Quantity;
        printer
          .align('ct')
          .text(spaced)
      });
      printer
        .text('')
        .text('')
        .text('')
        .text('')
        .cut()
    });
  },

  '/orm/transactions/in-shift-all/': (params) => {
    return Transaction.select('id').where(params).run();
  }
});
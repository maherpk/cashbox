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
    let query = `created_at BETWEEN '${start}'::timestamp AND '${end}'::timestamp;`;
    //return Transaction.select('*').whereBetween('created_at'. start, end).run();
    return Transaction.select('*').whereRaw(query)
  },

  '/orm/transactions/print/': (data) => {
    let resp = {};
    try {
      let device = new Escpos.USB();
      let printer = new Escpos.Printer(device);
      let time = new Date().toLocaleString('en-US', {
        timeZone: 'Asia/Karachi'
      });
      let obj = {};
      obj.DATE = time;
      obj.ITEMS = data.items;
      obj.People = data.trans.properties.people;
      obj.Table = data.trans.properties.table;
      obj.SalesTax = parseFloat(data.trans.tax).toFixed(2)
      obj.Discount = parseFloat(data.trans.discount_value).toFixed(2)
      obj.SubTotal = parseFloat(data.trans.items_total).toFixed(2)
      obj.GrandTotal = parseFloat(data.trans.grand_total).toFixed(2)

      Escpos.Image.load('../web.browser/app/imgs/logo.png', function(image) {

        device.open(function() {
          printer
            .align('ct')
            .raster(image)
            .size(3, 3)
            .text('Emporium Mall Lahore')
            .text('GST#: 41709462')
            .text('')
            .font('a')
            .align('ct')
            .style('bu')
            .text('Purchase Invoice')
            .text(obj.DATE)
            .text('Cover'+ ' '.repeat(20-7)+obj.People+ ' '.repeat(4) + 'Table'+' '.repeat(24-7)+obj.Table)
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
            printer
              .align('ct')
              .text(spaced)
          });
          let sB = 'Sub Total' + obj.SubTotal + '.00';
          let sBSpaced = 'Sub Total' + ' '.repeat(48 - sB.length) + obj.SubTotal + '.00';
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
          let tO = 'Total' + obj.GrandTotal;
          let tOSpaced = 'Total' + " ".repeat(48 - tO.length) + obj.GrandTotal;
          printer
            .text(tOSpaced)
            .text('')
            .text('')
            .align('ct')
            .text('Thank You for visiting Us.')
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

  '/orm/transactions/duplicate-print/': (data, id) => {
    let resp = {};
    try {
      let device = new Escpos.USB();
      let printer = new Escpos.Printer(device);
      let time = new Date().toLocaleString('en-US', {
        timeZone: 'Asia/Karachi'
      });
      let obj = {};
      obj.Id = id;
      obj.DATE = time;
      obj.ITEMS = data.items;
      obj.People = data.trans.properties.people;
      obj.Table = data.trans.properties.table;
      obj.SalesTax = parseFloat(data.trans.tax).toFixed(2);
      obj.Discount = parseFloat(data.trans.discount_value).toFixed(2);
      obj.SubTotal = parseFloat(data.trans.items_total).toFixed(2);
      obj.GrandTotal = parseFloat(data.trans.grand_total).toFixed(2);
      obj.CashIn = parseFloat(data.trans.cash).toFixed(2);
      obj.CardRecp = data.trans.recp;
      obj.Balance = Math.floor(data.trans.balance);

      let bN = 'Bill#' + String(obj.Id);
      let bNSpaced = 'Bill#' + ' '.repeat(48-bN.length) + String(obj.Id);

      Escpos.Image.load('../web.browser/app/imgs/logo.png', function(image) {
        device.open(function() {
          printer
            .align('ct')
            .raster(image)
            .size(3, 3)
            .text('Emporium Mall Lahore')
            .text('GST#: 41709462')
            .text('')
            .font('a')
            .align('ct')
            .style('bu')
            .text('Counter Copy')
            .text('Purchase Invoice')
            .size(3, 3)
            .text(obj.DATE)
            .text('Cover'+ ' '.repeat(20-7)+obj.People+ ' '.repeat(4) + 'Table'+' '.repeat(24-7)+obj.Table)
            .text(bNSpaced)
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
            printer
              .align('ct')
              .text(spaced)
          });
          let sB = 'Sub Total' + obj.SubTotal + '.00';
          let sBSpaced = 'Sub Total' + ' '.repeat(48 - sB.length) + obj.SubTotal + '.00';
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
          let tO = 'Total' + obj.GrandTotal;
          let tOSpaced = 'Total' + " ".repeat(48 - tO.length) + obj.GrandTotal;
          printer
            .text(tOSpaced)

          if(obj.CashIn>0) {
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
    } catch (err) {
      console.log(err);
      resp.status = false;
      resp.error = err
      resp.message = 'Check if Printer is connected and turned On.';
      return resp;
    }
  },

  '/orm/transactions/in-shift-all/': (params) => {
    return Transaction.select('id').where(params).run();
  }
});
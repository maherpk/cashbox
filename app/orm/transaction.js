import _ from 'lodash';

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
    let device = new Escpos.USB();
    let printer = new Escpos.Printer(device);
    let time = new Date();
    let obj = {};
    let subTotal = 0;
    obj.DATE = time;
    obj.ITEMS = data.items;
    obj.SalesTax = parseFloat(data.trans.properties.tax).toFixed(2)
    obj.Total = parseFloat(data.trans.properties.total).toFixed(2)

    device.open(function() {
      printer
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
        let spaced = item.Name + " ".repeat(48 - string.length) + " ".repeat(3 - String(item.Quantity).length) + item.Quantity + " ".repeat(5 - String(item.Price).length) + item.Price + '.00';
        subTotal += parseInt(item.Price);
        printer
          .align('ct')
          .text(spaced)
      });
      let sB = 'Sub Total' + subTotal + '.00';
      let sBSpaced = 'Sub Total' + ' '.repeat(48-sB.length) + subTotal + '.00';
      printer
        .align('ct')
        .text('-'.repeat(48))
        .control('LF')
        .text(sBSpaced)
      let sT = 'Sales Tax' + obj.SalesTax;
      let sTSpaced = 'Sales Tax' + " ".repeat(48 - sT.length) + obj.SalesTax;
      printer
        .text(sTSpaced)
        .size(2, 2)
        .control('LF')
      let tO = 'Total' + obj.Total;
      let tOSpaced = 'Total' + " ".repeat(48 - tO.length) + obj.Total;
      printer
        .text(tOSpaced)
        .text('')
        .text('')
        .text('')
        .text('')
        .cut()

    });
  }
});
let Shifts = new PG.Table('shifts');

Meteor.methods({
  '/orm/shifts/add/': () => {
    let timestamp = new Date();
    return Shifts.returning(['id', 'started_at'])
      .insert({
        started_at: timestamp
      }).run()[0];
  },
  '/orm/shifts/end/': (shiftID) => {
    let timestamp = new Date();
    Shifts.update({ended_at: timestamp}).where({id: shiftID}).run();
    // return Shifts
    //   .where({
    //     id: shiftID
    //   }).udpate({
    //     ended_at: timestamp
    //   }).run();
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

      if(printer) {
        resp.status = true;
        object = printer;
      }

      return resp
    } catch (err) {
      resp.object = err;
      
      return resp
    }
  },

  '/orm/shifts/print-summary/': (data) => {
    let device = new Escpos.USB();
      let printer = new Escpos.Printer(device);
      let time = new Date();
      let obj = {};
      let subTotal = 0;
      obj.DATE = time;
      obj.CASH = parseFloat(data.cash).toFixed(2);
      obj.CARD = parseFloat(data.card).toFixed(2);
      let stCash = "Cash Amount" + String(obj.CASH);
      let stCard = "Card Amount" + String(obj.CARD);
      let stTotal = "Total" + String(obj.CASH + obj.CARD);
      let total = (parseFloat(data.cash) + parseFloat(data.card)).toFixed(2);

      Escpos.Image.load('http://localhost:3000/imgs/logo.png', function(image){
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
          .text('Shift Summary')
          .size(3, 3)
          .text(obj.DATE)
          .font('b')
          .style('normal')
          .text('_'.repeat(48))
          .size(2, 2)
          .control('LF')
          .text('Cash Amount' + ' '.repeat(48-stCash.length) + obj.CASH)
          .text('')
          .text('Card Amount' + ' '.repeat(48-stCard.length) + obj.CARD)
          .text('')
          .text('Total' + ' '.repeat(48-stTotal.length) + total)
          .text('')
          .text('')
          .cut()
        });
    });
  }
});

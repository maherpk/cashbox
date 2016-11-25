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
  }
});

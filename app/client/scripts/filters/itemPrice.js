'use strict';

import _ from 'lodash';

export default function itemPrice() {
  return function(itemID, items) {
    let idx = _.findIndex(items, {id: itemID});
    let price = (idx > -1) ? items[idx].price : '';
    return price;
  };
}

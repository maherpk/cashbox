'use strict';

import _ from 'lodash';

export default function itemName() {
  return function(itemID, items) {
    let idx = _.findIndex(items, {id: itemID});
    let name = (idx > -1) ? items[idx].name : '';
    return name;
  };
}

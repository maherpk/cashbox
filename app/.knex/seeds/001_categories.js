
exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex('categories').del()
    .then(function () {
      return Promise.all([
        // Inserts seed entries
        knex('categories').insert(
          [
            {
              "id": 1,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "ALL DAY BREAKFAST & BRUNCH",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 2,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "WAFFLES PANCAKES, CREPES & FRUIT",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 3,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "ORGANIC FREE-RANGE FOLDED OMELETTES",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 4,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "SOUPS & SNACK",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 5,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "ARTISAN & ORGANIC SALADS",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 6,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "SNACKWICH SANDWICHES ( ON THE GO )",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 7,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "FLAME-GRILLED GOURMET BURGER",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 8,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "GRILLED PANINI SANDWICHES",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 9,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "PULLED SPICY BARBECUED MEAT",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 10,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "GRILLED MEZZA LUNA",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 11,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "STUFFED SAVOURY CRESPELLE",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 12,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "NEW ENTREES",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 13,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "PIES & PASTAS LEANER COMFORT FOOD",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 14,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "PATISSERIE & DESSERTS",
              "family": "food",
              "sub_family": null
            },
            {
              "id": 15,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "BLENDED FRAPPES & THICKSHAKES",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 16,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "GRANITA ICE BLEND SMOOTHIES",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 17,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "ICED COFFEES ON THE ROCKS",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 18,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "CAKESHAKES!",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 19,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "COLD LOW-FAT SEMIFREDDO DESSERTS",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 20,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "FRESH FRUIT SMOOTHIES & JUICES",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 21,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "LEMONADE ICED TEA & SOFT DRINKS",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 22,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "ARTISAN TEAS & HOT CHOCOLATE",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 23,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "MICRO-ROASTED SINGLE ESTATE COFFEES",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 24,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "CLASSIC HOT COFFEE BEVERAGES",
              "family": "beverage",
              "sub_family": null
            },
            {
              "id": 25,
              "created_at": "2016-11-03 17:05:26.143655",
              "updated_at": "2016-11-03 17:05:26.143655",
              "name": "FLAVOURED HOT SIGNATURE COFFEES",
              "family": "beverage",
              "sub_family": null
            }
          ]
        ),
        // knex('table_name').insert({ id: 2, colName: 'rowValue2' }),
        // knex('table_name').insert({ id: 3, colName: 'rowValue3' })
      ]);
    });
};

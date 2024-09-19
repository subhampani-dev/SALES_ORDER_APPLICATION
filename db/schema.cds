namespace order_entry_application;
using { cuid } from '@sap/cds/common';

entity OrderMaster : cuid {
  orderId: Integer @assert.unique @mandatory;
  productId: Integer @assert.unique @mandatory;
  quantity: Integer @mandatory;
  orderDate: Date;
  orderAddress: String(200);
}

entity ProductMaster{
  productId: Integer @assert.unique @mandatory;
  productName: String(100);
  productQuantity: Integer;
  productPrice: Decimal(10,2);
}


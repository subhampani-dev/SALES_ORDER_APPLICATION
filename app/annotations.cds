using { order_entry_applicationSrv } from '../srv/service.cds';

annotate order_entry_applicationSrv.OrderMaster with @UI.HeaderInfo: { TypeName: 'Order Master', TypeNamePlural: 'Order Masters', Title: { Value: orderId } };
annotate order_entry_applicationSrv.OrderMaster with {
  ID @UI.Hidden @Common.Text: { $value: orderId, ![@UI.TextArrangement]: #TextOnly }
};
annotate order_entry_applicationSrv.OrderMaster with @UI.Identification: [{ Value: orderId }];
annotate order_entry_applicationSrv.OrderMaster with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate order_entry_applicationSrv.OrderMaster with @UI.DataPoint #orderAddress: {
  Value: orderAddress,
  Title: 'Order Address',
};
annotate order_entry_applicationSrv.OrderMaster with {
  orderId @title: 'Order ID';
  productId @title : 'Product ID';
  quantity @title: 'Quantity';
  orderDate @title: 'Order Date';
  orderAddress @title: 'Order Address';
};

annotate order_entry_applicationSrv.OrderMaster with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: orderId },
    { $Type: 'UI.DataField', Value: productId },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: orderAddress }
];

annotate order_entry_applicationSrv.OrderMaster with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: orderId },
    { $Type: 'UI.DataField', Value: productId },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: orderAddress }
  ]
};

annotate order_entry_applicationSrv.OrderMaster with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderAddress' }
];

annotate order_entry_applicationSrv.OrderMaster with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate order_entry_applicationSrv.OrderMaster with @UI.SelectionFields: [
  orderId
];

annotate order_entry_applicationSrv.ProductMaster with @UI.HeaderInfo: { TypeName: 'Product Master', TypeNamePlural: 'Product Masters', Title: { Value: productId } };
annotate order_entry_applicationSrv.ProductMaster with {
  ID @UI.Hidden @Common.Text: { $value: productId, ![@UI.TextArrangement]: #TextOnly }
};
annotate order_entry_applicationSrv.ProductMaster with @UI.Identification: [{ Value: productId }];
annotate order_entry_applicationSrv.ProductMaster with {
  productName @title: 'Product Name';
  productQuantity @title: 'Product Quantity';
  productPrice @title: 'Product Price'
};

annotate order_entry_applicationSrv.ProductMaster with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: productQuantity },
    { $Type: 'UI.DataField', Value: productPrice }
];

annotate order_entry_applicationSrv.ProductMaster with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: productQuantity },
    { $Type: 'UI.DataField', Value: productPrice }
  ]
};

annotate order_entry_applicationSrv.ProductMaster with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate order_entry_applicationSrv.ProductMaster with @UI.SelectionFields: [
  productId
];


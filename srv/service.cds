using { order_entry_application as my } from '../db/schema.cds';

@path: '/service/order_entry_application'
@requires: 'authenticated-user'
service order_entry_applicationSrv {
  @odata.draft.enabled
  entity OrderMaster as projection on my.OrderMaster;
  @odata.draft.enabled
  entity ProductMaster as projection on my.ProductMaster;
}
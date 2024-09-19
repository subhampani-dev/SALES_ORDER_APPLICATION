/**
 * @Before(event = { "CREATE","UPDATE" }, entity = "order_entry_applicationSrv.OrderMaster")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
    const { ProductMaster } = cds.entities;

    // Extracting productId and quantity from the request payload
    const { productId, quantity } = request.data;

    if (productId === undefined || quantity === undefined) {
        request.reject(400, "Product ID and Quantity must be provided.");
        return;
    }

    // Check the availability of the product
    const product = await SELECT.one.from(ProductMaster).where({ productId: productId });
    if (!product) {
        request.reject(404, `Product with ID ${productId} not found.`);
        return;
    }

    if (product.productQuantity < quantity) {
        request.reject(409, `Insufficient quantity for product ID ${productId}. Available quantity is ${product.productQuantity}.`);
        return;
    }

    // Reduce the product quantity in the database
    const updatedQuantity = product.productQuantity - quantity;
    await UPDATE(ProductMaster).set({ productQuantity: updatedQuantity }).where({ productId: productId });
};
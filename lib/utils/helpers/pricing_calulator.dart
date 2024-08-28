

class TPricingCalculator{

  // Calculate Price Based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate  = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // Calculate Shipping Cost
  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  // Calculate Tax
  static String calculateTax (double productPrice, String location){
    double taxRate  = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);

  }

  static double getTaxRateForLocation(String location){
    return 0.10; // Example of tax rate 10%
  }
  static double getShippingCost(String location){
    return 5.00; // Example of shipping cost $ 5
  }

  // sum all cart value and return total amount
  /*
  static double calculateCartTotal(CartModel cart){
    return cart.ite
  }

   */

}
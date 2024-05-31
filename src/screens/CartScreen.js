import React, { useState } from "react";
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Alert,
  StyleSheet,
  FlatList,
} from "react-native";

const CartScreen = ({ route, navigation }) => {
  const { firstName, lastName, totalCost } = route.params || {};
  const [deliveryOption, setDeliveryOption] = useState("");
  const [cart, setCart] = useState([]);

  const handlePlaceOrder = () => {
    navigation.navigate("CheckoutScreen");
  };

  const handleCancelOrder = () => {
    Alert.alert(
      "Cancel Order",
      "Are you sure you want to cancel the order?",
      [
        {
          text: "No",
          style: "cancel",
        },
        {
          text: "Yes",
          onPress: () => {
            Alert.alert("Order Cancelled", "Your order has been cancelled.");
            // Reset the form fields and cart if needed
          },
        },
      ],
      { cancelable: false }
    );
  };

  const toggleDeliveryOption = (option) => {
    setDeliveryOption(option);
  };

  return (
    <View style={styles.container}>
      <View>
        <Text style={styles.title}>Order Details</Text>
        <TextInput
          placeholder="First Name"
          value={firstName}
          editable={false}
          style={styles.input}
        />
        <TextInput
          placeholder="Last Name"
          value={lastName}
          editable={false}
          style={styles.input}
        />
        <View style={styles.deliveryOptions}>
          <View style={styles.deliveryOptionContainer}>
            <TouchableOpacity
              onPress={() => toggleDeliveryOption("Pickup at store")}
              style={[
                styles.deliveryOption,
                deliveryOption === "Pickup at store" &&
                  styles.selectedDeliveryOption,
              ]}
            >
              <Text style={styles.deliveryOptionText}>Pickup at store</Text>
            </TouchableOpacity>
          </View>
          <View style={styles.deliveryOptionContainer}>
            <TouchableOpacity
              onPress={() => toggleDeliveryOption("Home Delivery")}
              style={[
                styles.deliveryOption,
                deliveryOption === "Home Delivery" &&
                  styles.selectedDeliveryOption,
              ]}
            >
              <Text style={styles.deliveryOptionText}>Home Delivery</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
      <View style={styles.cartContainer}>
        <Text style={styles.title}></Text>
        {cart.length === 0 ? (
          <Text style={styles.errorText}></Text>
        ) : (
          <FlatList
            data={cart}
            keyExtractor={(item) => item.id}
            renderItem={({ item }) => (
              <Text style={styles.itemText}>
                {item.name} - {item.price} x {item.quantity}
              </Text>
            )}
          />
        )}
        <Text style={styles.totalText}>Total: AUD {totalCost.toFixed(2)}</Text>
      </View>
      <View style={styles.buttonContainer}>
        <TouchableOpacity
          onPress={handlePlaceOrder}
          style={[styles.button, { backgroundColor: "blue" }]}
        >
          <Text style={styles.buttonText}>Place Order</Text>
        </TouchableOpacity>
      </View>
      <View style={styles.buttonContainer}>
        <TouchableOpacity
          onPress={handleCancelOrder}
          style={[styles.button, { backgroundColor: "red" }]}
        >
          <Text style={styles.buttonText}>Cancel Order</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    marginTop: 20,
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 16,
    color: "#FF006B",
  },
  input: {
    height: 40,
    borderWidth: 1,
    borderColor: "#ccc",
    marginBottom: 10,
    paddingHorizontal: 10,
  },
  deliveryOptions: {
    flexDirection: "row",
    justifyContent: "center",
    marginBottom: 20,
  },
  deliveryOptionContainer: {
    flex: 1,
  },
  deliveryOption: {
    backgroundColor: "#ccc",
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 5,
  },
  selectedDeliveryOption: {
    backgroundColor: "black",
  },
  deliveryOptionText: {
    color: "#fff",
    textAlign: "center",
  },
  cartContainer: {
    marginTop: 20,
  },
  itemText: {
    fontSize: 16,
    marginBottom: 8,
  },
  errorText: {
    fontSize: 16,
    color: "red",
  },
  totalText: {
    fontSize: 18,
    fontWeight: "bold",
    marginTop: 10,
  },
  buttonContainer: {
    marginTop: 10,
  },
  button: {
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 5,
  },
  buttonText: {
    color: "#fff",
    fontWeight: "bold",
    textAlign: "center",
  },
});

export default CartScreen;

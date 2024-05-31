import React, { useState } from "react";
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  Alert,
} from "react-native";

const CheckoutScreen = () => {
  const [cardNumber, setCardNumber] = useState("");
  const [expirationDate, setExpirationDate] = useState("");
  const [cvv, setCvv] = useState("");

  const handleSubmitOrder = () => {
    // Perform payment processing logic here
    // ...
    // Display alert message
    Alert.alert(
      "Order Confirmation",
      "Thank you for shopping with us! Please check your email for your order confirmation and details."
    );
  };

  return (
    <View style={styles.container}>
      <Text style={styles.heading}>Checkout</Text>
      <Text style={styles.label}>Card No:</Text>
      <TextInput
        style={styles.input}
        value={cardNumber}
        onChangeText={setCardNumber}
        keyboardType="numeric"
      />
      <Text style={styles.label}>Expiration Date:</Text>
      <TextInput
        style={styles.input}
        value={expirationDate}
        onChangeText={setExpirationDate}
      />
      <Text style={styles.label}>CVV:</Text>
      <TextInput
        style={styles.input}
        value={cvv}
        onChangeText={setCvv}
        keyboardType="numeric"
        maxLength={3}
      />
      <TouchableOpacity style={styles.button} onPress={handleSubmitOrder}>
        <Text style={styles.buttonText}>Submit Order</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: "#fff",
  },
  heading: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 16,
    color: "#008000", // Green color
  },
  label: {
    fontWeight: "bold",
    marginBottom: 4,
  },
  input: {
    height: 40,
    borderColor: "#ccc",
    borderWidth: 1,
    marginBottom: 12,
    paddingHorizontal: 8,
  },
  button: {
    backgroundColor: "#0000ff", // Blue color
    paddingVertical: 12,
    paddingHorizontal: 16,
    borderRadius: 4,
  },
  buttonText: {
    color: "#fff",
    fontWeight: "bold",
    textAlign: "center",
  },
});

export default CheckoutScreen;

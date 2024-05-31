import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity, Image, ScrollView, Alert } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import { useShoppingList } from '../context/ShoppingListContext';

const ShoppingListScreen = () => {
  const navigation = useNavigation();
  const { shoppingList, updateQuantity, removeFromShoppingList } = useShoppingList();

  const handleRemoveProduct = (productId) => {
    Alert.alert(
      'Delete Product',
      'Are you sure you want to delete this product?',
      [
        {
          text: 'Cancel',
          style: 'cancel',
        },
        {
          text: 'Delete',
          onPress: () => removeFromShoppingList(productId),
          style: 'destructive',
        },
      ]
    );
  };

  const handleComparePrice = () => {
    navigation.navigate('ComparePriceScreen', { shoppingList });
  };

  const handleContinueShopping = () => {
    navigation.navigate('Explore');
  };

  const handleSaveShoppingList = () => {
    Alert.alert('Shopping List Saved', 'Your shopping list has been saved.');
  };

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text style={styles.title}>ShoppingList</Text>
      {shoppingList.map((item, index) => (
        <View key={item.id} style={styles.productItem}>
          <View style={styles.deleteButtonContainer}>
            <TouchableOpacity onPress={() => handleRemoveProduct(item.id)}>
              <Ionicons name="trash" size={30} color="red" />
            </TouchableOpacity>
          </View>
          <Image source={{ uri: item.image_url }} style={styles.productImage} />
          <Text style={styles.productName}>{item.name}</Text>
          <View style={styles.productInfoContainer}>
            <Text style={styles.quantityLabel}>{item.volume}</Text>
            <View style={styles.quantityContainer}>
              <TouchableOpacity
                style={styles.quantityButton}
                onPress={() => updateQuantity(item.id, item.quantity - 1)}
              >
                <Ionicons name="remove" size={24} color="black" />
              </TouchableOpacity>
              <Text style={styles.quantity}>{item.quantity}</Text>
              <TouchableOpacity
                style={styles.quantityButton}
                onPress={() => updateQuantity(item.id, item.quantity + 1)}
              >
                <Ionicons name="add" size={24} color="black" />
              </TouchableOpacity>
            </View>
          </View>
          {index < shoppingList.length - 1 && <View style={styles.separator} />}
        </View>
      ))}
      <View style={styles.buttonContainer}>
        <TouchableOpacity
          style={[styles.button, styles.fullWidth]}
          onPress={handleSaveShoppingList}
        >
          <Text style={styles.buttonText}>Save ShoppingList</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.button, styles.fullWidth]}
          onPress={handleComparePrice}
        >
          <Text style={styles.buttonText}>Compare Price</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.button, styles.fullWidth]}
          onPress={handleContinueShopping}
        >
          <Text style={styles.buttonText}>Continue Shopping</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    alignItems: 'center',
    paddingVertical: 20,
    backgroundColor: 'white',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FF006B',
    marginBottom: 20,
  },
  productItem: {
    alignItems: 'center',
    marginBottom: 20,
    width: '100%',
    position: 'relative',
  },
  productInfoContainer: {
    alignItems: 'center',
    width: '100%',
  },
  productImage: {
    width: 200,
    height: 200,
    resizeMode: 'contain',
    marginBottom: 10,
    marginTop: 20,
  },
  productName: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  quantityLabel: {
    fontSize: 16,
    marginBottom: 5,
  },
  quantityContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 20,
  },
  quantityButton: {
    borderWidth: 1,
    borderColor: 'gray',
    borderRadius: 10,
    padding: 5,
    marginHorizontal: 10,
  },
  quantity: {
    fontSize: 18,
    marginHorizontal: 10,
  },
  buttonContainer: {
    alignItems: 'center',
    width: '100%',
  },
  button: {
    backgroundColor: '#FF006B',
    paddingVertical: 12,
    paddingHorizontal: 50,
    borderRadius: 5,
    marginVertical: 7,
    alignItems: 'center',
  },
  fullWidth: {
    width: '80%',
  },
  buttonText: {
    color: 'white',
    fontWeight: 'bold',
  },
  deleteButtonContainer: {
    position: 'absolute',
    right: 10,
    top: 10,
  },
  separator: {
    height: 1,
    width: '90%',
    backgroundColor: '#ccc',
    marginVertical: 20,
  },
});

export default ShoppingListScreen;

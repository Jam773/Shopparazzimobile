import React, { useState } from 'react';
import { View, Text, StyleSheet, TextInput, TouchableOpacity, ScrollView, Image } from 'react-native';
import { useNavigation, useRoute } from '@react-navigation/native';

const products = [
  { id: '1', name: 'Cadbury Dairy Milk Chocolate Block', image: require('../../assets/Choco1.png') },
];

const ExploreScreen = () => {
  const navigation = useNavigation();
  const route = useRoute();
  const [quantity, setQuantity] = useState(0);

  const { searchText } = route.params || {};

  const filteredProducts = products.filter(product =>
    product.name.toLowerCase().includes(searchText.toLowerCase())
  );

  const handleAddToList = () => {
    navigation.navigate('ShoppingList', { product: filteredProducts[0], quantity });
  };

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text style={styles.title}>Product Details</Text>
      {filteredProducts.map(product => (
        <View key={product.id} style={styles.productItem}>
          <Image source={product.image} style={styles.productImage} />
          <Text style={styles.productName}>{product.name}</Text>
          <Text style={styles.quantityLabel}>180g $3.00</Text>
          <View style={styles.quantityContainer}>
            <Text style={styles.quantityLabel}>Quantity:</Text>
            <TextInput
              style={styles.quantityInput}
              placeholder="0-10"
              keyboardType="numeric"
              value={quantity.toString()}
              onChangeText={text => setQuantity(parseInt(text) || 0)}
            />
          </View>
        </View>
      ))}
      <TouchableOpacity style={styles.addButton} onPress={handleAddToList}>
        <Text style={styles.addButtonLabel}>Add to List</Text>
      </TouchableOpacity>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    paddingTop: 20,
    paddingBottom: 40,
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FF006B',
    marginBottom: 20,
  },
  productItem: {
    alignItems: 'center',
    marginBottom: 50,
  },
  productImage: {
    width: 180,
    height: 180,
    resizeMode: 'contain',
    borderRadius: 10,
  },
  productName: {
    fontSize: 18,
    fontWeight: 'bold',
    marginTop: 10,
  },
  quantityContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 20,
  },
  quantityLabel: {
    fontSize: 20,
    marginRight: 10,
    marginTop: 10,
  },
  quantityInput: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    paddingHorizontal: 10,
    width: 50,
    textAlign: 'center',
    marginTop: 10,
  },
  addButton: {
    backgroundColor: '#FF006B',
    paddingVertical: 15,
    paddingHorizontal: 20,
    borderRadius: 20,
    marginTop: 10,
  },
  addButtonLabel: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default ExploreScreen;

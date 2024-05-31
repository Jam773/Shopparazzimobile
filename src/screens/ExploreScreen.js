import React, { useState, useEffect } from "react";
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Image,
  ActivityIndicator,
} from "react-native";
import { useNavigation, useRoute } from "@react-navigation/native";
import axios from "axios";
import { useShoppingList } from "../context/ShoppingListContext";
import FlashMessage, { showMessage } from "react-native-flash-message";
import { FontAwesome } from '@expo/vector-icons';

const ExploreScreen = () => {
  const navigation = useNavigation();
  const route = useRoute();
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [quantity, setQuantity] = useState({});
  const [searchText, setSearchText] = useState("");
  const [filteredProducts, setFilteredProducts] = useState([]);
  const { addToShoppingList } = useShoppingList();

  useEffect(() => {
    console.log('Fetching products...');
    axios.get('http://10.1.36.255:3002/products', { timeout: 10000 })
      .then(response => {
        console.log('Products fetched:', response.data);
        setProducts(response.data);
        setFilteredProducts(response.data); 
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching products:', error);
        setLoading(false);
      });
  }, []);

  const handleSearch = () => {
    if (searchText.trim() === "") {
      setFilteredProducts(products);
    } else {
      const results = products.filter((product) =>
        product.name.toLowerCase().includes(searchText.toLowerCase())
      );
      setFilteredProducts(results);
    }
  };

  const handleAddToList = (product) => {
    const productQuantity = quantity[product.id] || 0; // Default quantity to 0 if not set
    if (productQuantity === 0) {
      showMessage({
        message: "Please set a quantity greater than 0.",
        type: "warning",
      });
      return;
    }
    addToShoppingList({ ...product, quantity: productQuantity });
    showMessage({
      message: "Successfully added to the shopping list!",
      type: "success",
    });
    console.log('Adding to list:', product, 'Quantity:', productQuantity);
  };

  const increaseQuantity = (productId) => {
    setQuantity(prevQuantity => ({
      ...prevQuantity,
      [productId]: (prevQuantity[productId] || 0) + 1,
    }));
  };

  const decreaseQuantity = (productId) => {
    setQuantity(prevQuantity => ({
      ...prevQuantity,
      [productId]: Math.max((prevQuantity[productId] || 0) - 1, 0),
    }));
  };

  if (loading) {
    return (
      <View style={styles.loaderContainer}>
        <ActivityIndicator size="large" color="#FF006B" />
      </View>
    );
  }

  return (
    <View style={{ flex: 1 }}>
      <ScrollView contentContainerStyle={styles.container}>
        <Text style={styles.title}>Product Details</Text>
        <View style={styles.searchContainer}>
          <TextInput
            style={styles.searchInput}
            placeholder="Search products..."
            value={searchText}
            onChangeText={setSearchText}
          />
          <TouchableOpacity onPress={handleSearch} style={styles.searchButton}>
            <FontAwesome name="search" size={20} color="#FF006B" />
          </TouchableOpacity>
        </View>
        {filteredProducts.map((product, index) => (
          <View key={product.id} style={styles.productItem}>
            {product.image_url && (
              <Image source={{ uri: product.image_url }} style={styles.productImage} />
            )}
            {product.name && (
              <Text style={styles.productName}>{product.name}</Text>
            )}
            {product.volume && (
              <Text style={styles.productVolume}>{product.volume}</Text>
            )}
            <View style={styles.quantityContainer}>
              <Text style={styles.quantityLabel}>Quantity:</Text>
              <TouchableOpacity onPress={() => decreaseQuantity(product.id)} style={styles.quantityButton}>
                <Text style={styles.quantityButtonLabel}>-</Text>
              </TouchableOpacity>
              <TextInput
                style={styles.quantityInput}
                value={(quantity[product.id] || 0).toString()} // Default quantity to 0 if not set
                editable={false}
              />
              <TouchableOpacity onPress={() => increaseQuantity(product.id)} style={styles.quantityButton}>
                <Text style={styles.quantityButtonLabel}>+</Text>
              </TouchableOpacity>
            </View>
            <TouchableOpacity style={styles.addButton} onPress={() => handleAddToList(product)}>
              <Text style={styles.addButtonLabel}>Add to List</Text>
            </TouchableOpacity>
            {index < filteredProducts.length - 1 && (
              <View style={styles.separator} />
            )}
          </View>
        ))}
      </ScrollView>
      <FlashMessage position="top" />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    paddingTop: 20,
    paddingBottom: 40,
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    color: "#FF006B",
    marginBottom: 20,
  },
  searchContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    width: '90%',
    marginBottom: 20,
  },
  searchInput: {
    height: 40,
    borderColor: "#ccc",
    borderWidth: 1,
    borderRadius: 5,
    paddingHorizontal: 10,
    flex: 1,
  },
  searchButton: {
    marginLeft: 10,
    padding: 10,
  },
  productItem: {
    alignItems: "center",
    marginBottom: 20,
    width: '100%',
  },
  productImage: {
    width: 180,
    height: 180,
    resizeMode: "contain",
    borderRadius: 10,
  },
  productName: {
    fontSize: 18,
    fontWeight: "bold",
    marginTop: 10,
  },
  productVolume: {
    fontSize: 16,
    marginTop: 5,
  },
  quantityContainer: {
    flexDirection: "row",
    alignItems: "center",
    marginTop: 20,
  },
  quantityLabel: {
    fontSize: 16,
    marginRight: 10,
  },
  quantityInput: {
    fontSize: 16,
    paddingHorizontal: 10,
    width: 60,
    textAlign: "center",
    marginHorizontal: 10,
  },
  quantityButton: {
    backgroundColor: "#fff",
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderRadius: 5,
    borderWidth: 1, 
    borderColor: "#A9A9A9", 
  },
  quantityButtonLabel: {
    color: "#000", // 
    fontSize: 20,
  },
  addButton: {
    backgroundColor: "#FF006B",
    paddingVertical: 10,
    paddingHorizontal: 15,
    borderRadius: 20,
    marginTop: 10,
  },
  addButtonLabel: {
    color: "#fff", 
    fontSize: 16,
    fontWeight: "bold",
  },
  loaderContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  separator: {
    height: 1,
    width: '90%',
    backgroundColor: '#ccc',
    marginVertical: 20,
  },
});

export default ExploreScreen;

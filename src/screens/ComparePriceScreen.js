import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, ScrollView } from 'react-native';

const ComparePriceScreen = ({ route, navigation }) => {
  const { shoppingList = [] } = route.params;
  const [storeData, setStoreData] = useState([]);
  const [topStores, setTopStores] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchPrices = async () => {
      try {
        const response = await fetch('http://10.1.36.255:3002/api/store-prices');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setStoreData(Array.isArray(data) ? data : []);
      } catch (error) {
        setError('There was an error fetching the store prices. Please try again later.');
      } finally {
        setLoading(false);
      }
    };

    fetchPrices();
  }, []);

  useEffect(() => {
    if (Array.isArray(storeData) && storeData.length > 0 && Array.isArray(shoppingList) && shoppingList.length > 0) {
      const storeCosts = storeData.map((store) => {
        const totalCost = shoppingList.reduce((total, item) => {
          const product = store.products.find((p) => p.id === item.id);
          return total + (product ? product.price * item.quantity : 0);
        }, 0);
        return { ...store, totalCost };
      });

      const sortedStores = storeCosts.sort((a, b) => a.totalCost - b.totalCost);
      setTopStores(sortedStores.slice(0, 3));
    }
  }, [storeData, shoppingList]);

  const handlePlaceOrder = (store) => {
    navigation.navigate('Login', { store, totalCost: store.totalCost });
  };

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <Text>Loading...</Text>
      </View>
    );
  }

  if (error) {
    return (
      <View style={styles.errorContainer}>
        <Text>{error}</Text>
      </View>
    );
  }

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text style={styles.title}>Price Comparison</Text>
      {topStores.length > 0 ? (
        topStores.map((store, storeIndex) => (
          <View key={`${store.name}-${storeIndex}`} style={styles.storeContainer}>
            <Text style={styles.storeName}>{store.name}</Text>
            {shoppingList.map((item, itemIndex) => {
              const product = store.products.find((p) => p.id === item.id);
              return (
                <Text key={`${item.id}-${itemIndex}`} style={styles.productText}>
                  {item.name}: AUD {product ? product.price : 'N/A'} x {item.quantity}
                </Text>
              );
            })}
            <Text style={styles.totalText}>Total: AUD {store.totalCost.toFixed(2)}</Text>
            <TouchableOpacity
              style={styles.button}
              onPress={() => handlePlaceOrder(store)}
            >
              <Text style={styles.buttonText}>Place order from {store.name}</Text>
            </TouchableOpacity>
          </View>
        ))
      ) : (
        <Text>No data available</Text>
      )}
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    padding: 20,
    backgroundColor: 'white',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 20,
    textAlign: 'center',
  },
  storeContainer: {
    marginBottom: 20,
    padding: 10,
    borderRadius: 5,
    backgroundColor: '#f8f8f8',
    elevation: 2,
  },
  storeName: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  productText: {
    fontSize: 16,
  },
  totalText: {
    fontSize: 16,
    fontWeight: 'bold',
    marginTop: 10,
  },
  button: {
    backgroundColor: '#FF006B',
    paddingVertical: 12,
    paddingHorizontal: 20,
    borderRadius: 5,
    marginVertical: 7,
    alignItems: 'center',
  },
  buttonText: {
    color: 'white',
    fontWeight: 'bold',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default ComparePriceScreen;

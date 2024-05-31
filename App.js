import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import HomeScreen from './src/screens/HomeScreen';
import ExploreScreen from './src/screens/ExploreScreen';
import ShoppingListScreen from './src/screens/ShoppingListScreen';
import CartScreen from './src/screens/CartScreen';
import LoginScreen from './src/screens/LoginScreen';
import ProductDetailScreen from './src/screens/ProductDetailScreen';
import BottomNavigation from './src/components/BottomNavigation';
import WelcomeScreen from './src/components/WelcomeScreen';
import ComparePriceScreen from './src/screens/ComparePriceScreen';
import CheckoutScreen from './src/components/CheckoutScreen';
import { ShoppingListProvider } from './src/context/ShoppingListContext';

const Tab = createBottomTabNavigator();
const Stack = createStackNavigator();

const HomeStack = () => (
  <Stack.Navigator>
    <Stack.Screen name="HomeScreen" component={HomeScreen} options={{ title: "Home" }} />
    <Stack.Screen name="ProductDetail" component={ProductDetailScreen} options={{ title: "Product Detail" }} />
    <Stack.Screen name="ShoppingList" component={ShoppingListScreen} options={{ title: "Shopping List" }} />
    <Stack.Screen name="CheckoutScreen" component={CheckoutScreen} options={{ title: "Checkout" }} />
    <Stack.Screen name="ComparePrice" component={ComparePriceScreen} options={{ title: "Compare Price" }} />
    <Stack.Screen name="CartScreen" component={CartScreen} options={{ title: "Cart" }} />
  </Stack.Navigator>
);

const MainTabNavigator = () => (
  <Tab.Navigator tabBar={(props) => <BottomNavigation {...props} />}>
    <Tab.Screen
      name="HomeTab"
      component={HomeStack}
      options={{
        tabBarLabel: "Home",
        tabBarIcon: "home-outline",
        tabBarIconFocused: "home",
      }}
    />
    <Tab.Screen
      name="Explore"
      component={ExploreScreen}
      options={{
        tabBarLabel: "Explore",
        tabBarIcon: "search-outline",
        tabBarIconFocused: "search",
      }}
    />
    <Tab.Screen
      name="Cart"
      component={CartScreen}
      options={{
        tabBarLabel: "Cart",
        tabBarIcon: "cart-outline",
        tabBarIconFocused: "cart",
      }}
    />
    <Tab.Screen
      name="ShoppingList"
      component={ShoppingListScreen}
      options={{
        tabBarLabel: "Shopping List",
        tabBarIcon: "heart-outline",
        tabBarIconFocused: "heart",
      }}
    />
    <Tab.Screen
      name="Account"
      component={LoginScreen}
      options={{
        tabBarLabel: "Account",
        tabBarIcon: "person-outline",
        tabBarIconFocused: "person",
      }}
    />
  </Tab.Navigator>
);

const App = () => {
  return (
    <ShoppingListProvider>
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen
            name="Welcome"
            component={WelcomeScreen}
            options={{ headerShown: false }}
          />
          <Stack.Screen
            name="Main"
            component={MainTabNavigator}
            options={{ headerShown: false }}
          />
          <Stack.Screen
            name="ComparePriceScreen"
            component={ComparePriceScreen}
            options={{ title: "Compare Price" }}
          />
          <Stack.Screen
            name="ProductDetail"
            component={ProductDetailScreen}
            options={{ headerShown: false }}
          />
          <Stack.Screen
            name="Checkout"
            component={CheckoutScreen}
            options={{ title: "Checkout" }}
          />
          <Stack.Screen
            name="Cart"
            component={CartScreen}
            options={{ headerShown: false }}
          />
          <Stack.Screen
            name="Login"
            component={LoginScreen}
            options={{ title: "Login" }}
          />
        </Stack.Navigator>
      </NavigationContainer>
    </ShoppingListProvider>
  );
};

export default App;

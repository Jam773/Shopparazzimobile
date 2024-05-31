import React, { createContext, useContext, useState } from 'react';

const ShoppingListContext = createContext();

export const useShoppingList = () => {
  return useContext(ShoppingListContext);
};

export const ShoppingListProvider = ({ children }) => {
  const [shoppingList, setShoppingList] = useState([]);

  const addToShoppingList = (product) => {
    setShoppingList((prevList) => [...prevList, { ...product, quantity: 1 }]);
  };

  const removeFromShoppingList = (productId) => {
    setShoppingList((prevList) => prevList.filter((item) => item.id !== productId));
  };

  const updateQuantity = (productId, quantity) => {
    setShoppingList((prevList) =>
      prevList.map((item) =>
        item.id === productId ? { ...item, quantity: Math.max(0, quantity) } : item
      )
    );
  };

  return (
    <ShoppingListContext.Provider
      value={{ shoppingList, addToShoppingList, removeFromShoppingList, updateQuantity }}
    >
      {children}
    </ShoppingListContext.Provider>
  );
};

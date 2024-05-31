// components/BottomNavigation.js
// This is the BottomNavigation component used across multiple screens for navigation.
import React from 'react';
import { View, TouchableOpacity, StyleSheet, Text } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const BottomNavigation = ({ state, descriptors, navigation }) => {
  const focusedOptions = descriptors[state.routes[state.index].key].options;

  if (focusedOptions.tabBarVisible === false) {
    return null;
  }

  return (
    <View style={styles.navContainer}>
      {state.routes.map((route, index) => {
        const { options } = descriptors[route.key];
        const label = options.tabBarLabel !== undefined
          ? options.tabBarLabel
          : options.title !== undefined
          ? options.title
          : route.name;

        const isFocused = state.index === index;

        const onPress = () => {
          const event = navigation.emit({
            type: 'tabPress',
            target: route.key,
            canPreventDefault: true,
          });

          if (!isFocused && !event.defaultPrevented) {
            navigation.navigate(route.name);
          }
        };

        const onLongPress = () => {
          navigation.emit({
            type: 'tabLongPress',
            target: route.key,
          });
        };

        let iconName;
        switch (route.name) {
          case 'Home':
            iconName = isFocused ? 'home' : 'home-outline';
            break;
          case 'ComparePrice':
            iconName = isFocused ? 'list-circle' : 'list-circle-outline';
            break;
          case 'ShoppingList':
            iconName = isFocused ? 'clipboard' : 'clipboard-outline'; // Changed icon for Shopping List
            break;
          case 'Cart':
            iconName = isFocused ? 'cart' : 'cart-outline';
            break;
          case 'Login':
            iconName = isFocused ? 'person' : 'person-outline';
            break;
          default:
            iconName = isFocused ? options.tabBarIconFocused : options.tabBarIcon;
        }

        // Change the label for Cart to Orders
        const displayLabel = route.name === 'Cart' ? 'Orders' : label;

        return (
          <TouchableOpacity
            key={index}
            accessibilityRole="button"
            accessibilityStates={isFocused ? ['selected'] : []}
            accessibilityLabel={options.tabBarAccessibilityLabel}
            testID={options.tabBarTestID}
            onPress={onPress}
            onLongPress={onLongPress}
            style={styles.navItem}
          >
            <Ionicons
              name={iconName}
              size={24}
              color={isFocused ? '#FF006B' : '#222'}
            />
            <Text style={{ color: isFocused ? '#FF006B' : '#222' }}>
              {displayLabel}
            </Text>
          </TouchableOpacity>
        );
      })}
    </View>
  );
};

const styles = StyleSheet.create({
  navContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    paddingVertical: 10,
    borderTopWidth: 1,
    borderTopColor: '#ccc',
    backgroundColor: '#fff',
  },
  navItem: {
    alignItems: 'center',
  },
});

export default BottomNavigation;

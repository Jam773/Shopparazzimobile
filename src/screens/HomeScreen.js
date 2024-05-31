import React, { useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  TouchableOpacity,
  Image,
  FlatList,
} from "react-native";
import { Ionicons } from "@expo/vector-icons";
import { useNavigation } from "@react-navigation/native";

// Import local images for categories
import fruitsImage from "../../assets/cat1.png";
import meatImage from "../../assets/cat2.png";
import milkAndEggImage from "../../assets/cat3.png";
import snacksImage from "../../assets/cat4.png";

const HomeScreen = () => {
  const navigation = useNavigation();
  const [searchText, setSearchText] = useState("");
  const categories = [
    { id: "1", name: "Fruits", image: fruitsImage },
    { id: "2", name: "Meat", image: meatImage },
    { id: "3", name: "Milk & Egg", image: milkAndEggImage },
    { id: "4", name: "Snacks", image: snacksImage },
  ];

  const handleSearch = () => {
    navigation.navigate("Explore");
  };

  const handleCategoryPress = (category) => {
    if (category.name === "Snacks") {
      navigation.navigate("Explore");
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Shoparrazi</Text>
      <View style={styles.searchContainer}>
        <TextInput
          style={styles.searchInput}
          placeholder="Search"
          value={searchText}
          onChangeText={setSearchText}
        />
        <TouchableOpacity onPress={handleSearch}>
          <Ionicons name="search-outline" size={24} color="black" />
        </TouchableOpacity>
      </View>
      <View style={styles.categoriesSection}>
        <Text style={styles.sectionTitle}>Categories</Text>
        <FlatList
          data={categories}
          numColumns={2}
          keyExtractor={(item) => item.id}
          renderItem={({ item }) => (
            <TouchableOpacity
              style={styles.categoryItem}
              onPress={() => handleCategoryPress(item)}
            >
              <Image source={item.image} style={styles.categoryImage} />
              <Text style={styles.categoryText}>{item.name}</Text>
            </TouchableOpacity>
          )}
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
  },
  title: {
    fontSize: 24,
    fontWeight: "bold",
    color: "#FF006B",
    marginTop: 10,
    marginBottom: 10,
    marginLeft: 10,
  },
  searchContainer: {
    flexDirection: "row",
    borderWidth: 2,
    borderColor: "#FF006B",
    borderRadius: 5,
    padding: 10,
    margin: 10,
  },
  searchInput: {
    flex: 1,
  },
  categoriesSection: {
    marginVertical: 10,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: "bold",
    marginLeft: 20,
    marginTop: 10,
    marginBottom: 20,
  },
  categoryItem: {
    margin: 15,
    width: 150,
    height: 150,
    justifyContent: "center",
    alignItems: "center",
    borderRadius: 5,
  },
  categoryImage: {
    width: 180,
    height: 150,
    resizeMode: "contain",
    marginBottom: -20,
    borderRadius: 5,
    marginLeft: 28,
  },
  categoryText: {
    fontSize: 16,
    textAlign: "center",
    marginTop: 20,
    marginLeft: 28,
  },
});

export default HomeScreen;

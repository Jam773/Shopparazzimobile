import React, { useState } from 'react';
import { View, Text, StyleSheet, TextInput, TouchableOpacity, Image } from 'react-native';
import axios from 'axios';
import FontAwesome from 'react-native-vector-icons/FontAwesome';

import logo from '../../assets/logo.png'; 

const LoginScreen = ({ route, navigation }) => {
  const { store, totalCost } = route.params || {};
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async () => {
    try {
      const response = await axios.post('http://10.1.36.255:3002/login', { email, password });
      const { firstName, lastName } = response.data;
      navigation.navigate('Cart', { firstName, lastName, totalCost });
    } catch (error) {
      console.error('Login error:', error);
      Alert.alert('Login Failed', 'Please check your email and password and try again.');
    }
  };

  return (
    <View style={styles.container}>
      <Image source={logo} style={styles.logo} />
      <Text style={styles.header}>LOGIN</Text>
      <TextInput
        style={styles.input}
        placeholder="Your email"
        value={email}
        onChangeText={setEmail}
      />
      <TextInput
        style={styles.input}
        placeholder="Your password"
        secureTextEntry
        value={password}
        onChangeText={setPassword}
      />
      <TouchableOpacity style={styles.button} onPress={handleLogin}>
        <Text style={styles.buttonText}>Continue with email</Text>
      </TouchableOpacity>
      <Text style={styles.or}>Or</Text>
      <TouchableOpacity style={[styles.button, styles.googleButton]}>
        <FontAwesome name="google" size={20} color="#fff" style={styles.icon} />
        <Text style={styles.buttonText}>Sign in with Google</Text>
      </TouchableOpacity>
      <TouchableOpacity style={[styles.button, styles.facebookButton]}>
        <FontAwesome name="facebook" size={20} color="#fff" style={styles.icon} />
        <Text style={styles.buttonText}>Sign in with Facebook</Text>
      </TouchableOpacity>
      <Text style={styles.signUpText}>Don't have a Shopparazi account? Sign up</Text>
      {/* Bottom Navigation Component */}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#fff',
  },
  logo: {
    width: 100,
    height: 100,
    marginBottom: 20, 
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
    color: '#FF006B',
  },
  input: {
    width: '80%',
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    borderRadius: 5,
    paddingHorizontal: 10,
    marginBottom: 20,
  },
  button: {
    width: '80%',
    height: 40,
    backgroundColor: 'black',
    borderRadius: 5,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 10,
    flexDirection: 'row',
  },
  googleButton: {
    backgroundColor: '#DB4437',
  },
  facebookButton: {
    backgroundColor: '#3B5998',
  },
  buttonText: {
    color: '#fff',
    fontWeight: 'bold',
  },
  icon: {
    marginRight: 10,
  },
  or: {
    marginVertical: 20,
  },
  signUpText: {
    marginTop: 20,
  },
});

export default LoginScreen;

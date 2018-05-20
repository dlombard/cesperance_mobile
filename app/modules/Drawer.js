import React, { Component } from 'react';
import {
	Text,
	View,
	TouchableOpacity
} from 'react-native';
import { navigatorStyle } from '../styles/styles'
import Icon from 'react-native-vector-icons/Ionicons';
import LinearGradient from 'react-native-linear-gradient';

import styles from './styles/Drawer';
import { homeNavigator } from './home/HomeScreen'

class Drawer extends Component {
	constructor(props) {
		super(props);

		this._goToChants = this._goToChants.bind(this);
		this._openSearch = this._openSearch.bind(this);
	}


	_openSearch() {
		this._toggleDrawer();
		homeNavigator.push({
			screen: "cereact.Search"
		})
	}


	_openFavorites = () => {
		this._toggleDrawer();
		homeNavigator.push({
			screen: "cereact.Favorites"
		})
	}
	_goToChants() {
		this._toggleDrawer();
		this.props.navigator.popToRoot({
			screen: 'cereact.Home',
			navigatorStyle
		});
	}

	_toggleDrawer() {
		console.log('drawer')

		this.props.navigator.toggleDrawer({
			to: 'closed',
			side: 'left',
			animated: true
		});
	}

	render() {
		const iconSearch = (<Icon name="md-search" size={26} color="#9F9F9F" style={[styles.drawerListIcon, { paddingLeft: 2 }]} />);
		const iconFavorites = (<Icon name="md-heart" size={26} color="#9F9F9F" style={[styles.drawerListIcon, { paddingLeft: 2 }]} />);
		const iconMovies = (<Icon name="md-film" size={26} color="#9F9F9F" style={[styles.drawerListIcon, { paddingLeft: 3 }]} />);
		//const iconTV = (<Icon name="ios-desktop" size={26} color="#9F9F9F" style={styles.drawerListIcon} />);
		return (
			<LinearGradient colors={['rgba(0, 0, 0, 0.7)', 'rgba(0,0,0, 0.9)', 'rgba(0,0,0, 1)']} style={styles.linearGradient}>
				<View style={styles.container}>
					<View style={styles.drawerList}>
						<TouchableOpacity onPress={this._openSearch}>
							<View style={styles.drawerListItem}>
								{iconSearch}
								<Text style={styles.drawerListItemText}>
									Search
								</Text>
							</View>
						</TouchableOpacity>
						<TouchableOpacity onPress={this._openFavorites}>
							<View style={styles.drawerListItem}>
								{iconFavorites}
								<Text style={styles.drawerListItemText}>
									Favorites
								</Text>
							</View>
						</TouchableOpacity>
						<TouchableOpacity onPress={this._goToChants}>
							<View style={styles.drawerListItem}>
								<Text style={styles.drawerListItemText}>
									Movies
								</Text>
							</View>
						</TouchableOpacity>
						<View style={styles.drawerListItem}>
							<Text style={styles._version}>
								{/* 'v1.0.0' */}
							</Text>
						</View>
					</View>

				</View>
			</LinearGradient>
		);
	}
}

export default Drawer;
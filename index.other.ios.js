/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    Dimensions,
    ScrollView,
    AlertIOS,
    Alert,
} from 'react-native';



var {width,height} = Dimensions.get('window')
import MLView from './MLView';//引入view

import SycScrollView from './SycScrollView';  //引入原生自定义view

// var SycScrollView = require('./SycScrollView');

// var SycScrollViewContns = require('react-native').UIManager.SycScrollView.Constants;//导入常量
var bannerImages = [
    'http://upload-images.jianshu.io/upload_images/2321678-ba5bf97ec3462662.png?imageMogr2/auto-orient/strip%7CimageView2/2',
    'http://upload-images.jianshu.io/upload_images/1487291-2aec9e634117c24b.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/480/q/100',
    'http://f.hiphotos.baidu.com/zhidao/pic/item/e7cd7b899e510fb37a4f2df3db33c895d1430c7b.jpg'
];


export default class RNIOS extends Component {

    constructor(Props) {
        super(Props);
        this.state = {
            bannerNum :0
        }
    }

    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.welcome}>
                    RNOCtest
                </Text>
                <MLView style={styles.content}
                        dict={{'name':'syc'}} //模拟RN使用原生组件回传数据到oc
                        onClickView={(e) => {//模拟原生回传数据给RN
                            Alert.alert(
                                'Alert Title',
                                'My Alert Msg',
                                [
                                    {text: 'result'+e.nativeEvent, onPress: () => console.log('Ask me later pressed')},
                                    {text: 'Cancel', onPress: () => console.log('Cancel Pressed'), style: 'cancel'},
                                    {text: 'OK', onPress: () => console.log('OK Pressed')},
                                ],
                                { cancelable: false }
                            )
                            console.log('test' + e.nativeEvent.value);}}/>


                {/*<ScrollView style = {{marginTop:64}}>*/}
                {/*<View>*/}
                {/*<SycScrollView style={styles.content}*/}
                {/*autoScrollTimeInterval = {2}*/}
                {/*imageURLStringsGroup = {bannerImages}*/}
                {/*dict={{'name':'syc'}}*/}
                {/*pageControlAliment = {0}*/}
                {/*onClickView={(e) => {*/}
                {/*console.log('test' + e.nativeEvent.value);*/}
                {/*this.setState({bannerNum:e.nativeEvent.value});*/}
                {/*}}*/}

                {/*/>*/}
                {/*<Text style={{fontSize: 15, margin: 10, textAlign:'center'}}>*/}
                {/*点击banner -> {this.state.bannerNum}*/}
                {/*</Text>*/}
                {/*</View>*/}
                {/*</ScrollView>*/}
            </View>

        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
    sycScroll:{
        flex: 1,
        width:width,
        height:height-64-40,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#fa8b2d',
    },content:{
        backgroundColor: '#fa1b18',
        borderColor:'#e7e7e7',
        marginTop:10,
        height:200,
        width:width,
    }

});

AppRegistry.registerComponent('RNIOS', () => RNIOS);

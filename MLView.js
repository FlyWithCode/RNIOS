/**
 * Created by syc on 2018/2/6.
 */
import React, { Component, PropTypes } from 'react';

var { requireNativeComponent } = require('react-native');

var RNTMLView = requireNativeComponent('RNTMLView', RNTMLView);

export default class MLView extends Component {
    //添加属性检测
    static propTypes = {
        dict:PropTypes.object,
        onClickView:PropTypes.func,
    };
    render() {
        return <RNTMLView {...this.props}/>;

    }

}

module.exports = MLView;


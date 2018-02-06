/**
 * Created by syc on 2018/2/5.
 */
import React,{Component,PropTypes} from 'react';

var {requireNativeComponent} = require('react-native');
var RNSycScrollView = requireNativeComponent('SycScrollView',SycScrollView);

export default class SycScrollView extends Component {

    static propTypes = {
        dict:PropTypes.object,
        imageURLStringsGroup:PropTypes.array,
        onClickBanner:PropTypes.func,
        onClickView:PropTypes.func,
    };

    render() {
        return <RNSycScrollView {...this.props} />;
    }
}



module.exports = SycScrollView;
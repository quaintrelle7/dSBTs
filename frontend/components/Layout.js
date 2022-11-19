import React from 'react';
import Header from './Header';

function Layout(props) {
  return (
    <div className='layout' style={{background:"azure"}}>
    <Header/>
    {props.children}
    </div>
  )
};

export default Layout
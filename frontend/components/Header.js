import React from 'react'
import Link from 'next/link'

function Header() {

 
  return (
    <div className='header-js'>

    <div className='h-btn-div' style={{position:"absolute", right:'0'}}>
         <button className='header-btn' style={{ marginRight:"10%"}}>
         My Learning</button>
        <button className='header-btn' style={{ marginRight:"10%"}}>
        <Link href="/Achievements">Achievements</Link></button>

        {/* <img>Profle Pic</img> */}
    </div>
       
    </div>
  )
}

export default Header
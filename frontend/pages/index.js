import React from 'react'
import Layout from '../components/Layout';
import {courses} from "../courseData";
import SignIn from './signin';

class index extends React.Component{
  render(){
    return(
      <Layout>

  <div className="index">

  <div className='h-banner' style={{display:"flex"}}>
      <div className="connect-wallet" style={{marginLeft:"10%", marginTop:"10%", background:"#222a35", width:"20%", height:"30%", textAlign:"center", padding:"10px", borderRadius:"10px", color:"white"}}>
        <h3>Let`s start learning</h3>

        <SignIn/>
        <button style={{background:"#33ccb3", width:"8rem", height:"40px", fontWeight:"bold"}}>Connect Wallet </button>
      </div>
      <div className="desc" style={{marginLeft:"20%", marginTop:"10%", background:"azure", width:"80%", height:"30%", textAlign:"center", padding:"10px", borderRadius:"10px", color:"black"}}>
       <h1>Welcome to LearningCo!</h1>
      </div>

  </div>
   
      
      <div className="course-gallery">
          {
            courses.map((course)=>(
              <div className='course-item'>
                <h2>{course.title}</h2>
                <h4>By  {course.author}</h4>
                <h1>{course.price}</h1>
                <button style={{background:"#33ccb3",width:"fill", height:"40px", fontWeight:"bold"}}>Enroll in Course</button>
              </div>

            ))
          }
      </div>
    </div>
      </Layout>
    )
  }
}
export default index
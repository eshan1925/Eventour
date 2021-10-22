import React from "react";
import "./aboutDev.css";
import { FaLinkedinIn } from "react-icons/fa";
import { BsGithub } from "react-icons/bs";

function AboutDev({
  left,
  right,
  imgURL,
  name,
  description,
  LinkedIn_Link,
  Github_Link,
}) {
  return (
    <div className="about-block">
      {left && <img src={imgURL} alt="" height="350px" />}

      <div className="about-content">
        <h2>{name}</h2>
        <p>{description}</p>
        <div className="links">
          <a href={LinkedIn_Link} className="l-btn" target="_blank">
            Connect with him on
            <FaLinkedinIn />
          </a>
          <a href={Github_Link} className="g-btn" target="_blank">
            Follow him on
            <BsGithub />
          </a>
        </div>
      </div>
      {right && <img src={imgURL} alt="" height="350px" />}
    </div>
  );
}

export default AboutDev;

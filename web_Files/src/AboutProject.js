import React, { useEffect } from "react";
import Aos from "aos";
import "aos/dist/aos.css";
import styles from "./aboutproject.module.css";
import logo from "./assets/eventour_logo.png";
import screen1 from "./assets/phone&bg.png";
import StepsImg from "./assets/hand&bg.png";
import step1 from "./assets/step1.png";
import step2 from "./assets/step2.png";
import step3 from "./assets/step3.png";
import step4 from "./assets/step4.png";
import step5 from "./assets/step5.png";
import step6 from "./assets/step6.png";
import { Link } from "react-router-dom";

import { FiDownload } from "react-icons/fi";

function AboutProject() {
  useEffect(() => {
    Aos.init({ duration: 2000 });
  }, []);
  return (
    <div className={styles.page}>
      <div className={styles.buttonGrp}>
        <a
          className={styles.btn}
          href="https://drive.google.com/uc?id=1LiHCCd25rFQzkgK-F5_bZFVq6UyVr6DN&export=download"
          rel="noreferrer"
          target="_blank"
        >
          <div
            style={{
              display: "flex",
              alignItems: "center",
              justifyContent: "space-between",
            }}
          >
            Download the app
            <FiDownload />
          </div>
        </a>
        <Link to="/us" className={styles.Abtn}>
        <div
            style={{
              display: "flex",
              alignItems: "center",
              justifyContent: "space-between",
            }}
          >
            About Us
          </div>
        </Link>
      </div>
      <div className={styles.introNlogo}>
        <p>Introducing</p>
        <img src={logo} alt="" width="750px" />
      </div>

      <div className={styles.screen1}>
        <img
          src={StepsImg}
          alt=""
          height="450px"
          style={{ position: "relative", top: "3rem" }}
        />
        <img
          src={screen1}
          alt=""
          height="650px"
          style={{ position: "relative", bottom: "10rem", marginRight: "1rem" }}
        />
      </div>

      <div className={styles.step} data-aos="fade-right">
        <img src={step1} alt="step1" />
        <div className={styles.stepContent}>
          <h1>Step 1</h1>
          <p>Explore all the categories available</p>
        </div>
      </div>
      <div className={styles.step} data-aos="fade-left">
        <div className={styles.stepContent}>
          <h1>Step 2</h1>
          <p>Select your preferred venue</p>
        </div>
        <img src={step2} alt="step2" />
      </div>
      <div className={styles.step} data-aos="fade-right">
        <img src={step3} alt="step3" />
        <div className={styles.stepContent}>
          <h1>Step 3</h1>
          <p>Select the occasion you are looking for</p>
        </div>
      </div>
      <div className={styles.step} data-aos="fade-left">
        <div className={styles.stepContent}>
          <h1>Step 4</h1>
          <p>Choose your required services</p>
        </div>
        <img src={step4} alt="step4" />
      </div>
      <div className={styles.step} data-aos="fade-right">
        <img src={step5} alt="step5" />
        <div className={styles.stepContent}>
          <h1>Step 5</h1>
          <p>Select date and time of the occasion</p>
        </div>
      </div>
      <div className={styles.step} data-aos="fade-left">
        <div className={styles.stepContent}>
          <h1>Final Click !</h1>
          <p>Confirm your booking and we will work our magic !</p>
        </div>
        <img src={step6} alt="step6" />
      </div>
    </div>
  );
}

export default AboutProject;

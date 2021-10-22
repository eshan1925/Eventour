import React, { useState, useEffect } from "react";
import AboutDev from "./components/AboutDev";
import styles from "./about.module.css";
import Aos from "aos";
import "aos/dist/aos.css";

function About() {
  const [stuff, setStuff] = useState(null);

  useEffect(() => {
    fetch(
      "https://api.storyblok.com/v2/cdn/stories?cv=1634672182&starts_with=abt-section%2F&token=l6Za8xn0dmVndRZokMw7Egtt&version=published"
    )
      .then((response) => response.json())

      .then((data) => {
        setStuff(data.stories);
      });
  }, []);
  useEffect(() => {
    Aos.init({ duration: 2000 });
  }, []);
  return (
    <div className={styles.aboutPage}>
      <h1 style={{color: "#40c4ff"}}>About Us</h1>
      {stuff &&
        stuff.map((story, id) => {
          if (id % 2 === 0) {
            return (
              <div data-aos="fade-right">
                <AboutDev
                  left
                  name={story.content.name}
                  description={story.content.desc}
                  imgURL={story.content.image.filename}
                  LinkedIn_Link={story.content.L_btn.url}
                  Github_Link={story.content.G_btn.url}
                />
              </div>
            );
          } else {
            return (
              <div data-aos="fade-left">
                <AboutDev
                  right
                  name={story.content.name}
                  description={story.content.desc}
                  imgURL={story.content.image.filename}
                  LinkedIn_Link={story.content.L_btn.url}
                  Github_Link={story.content.G_btn.url}
                />
              </div>
            );
          }
        })}
    </div>
  );
}

export default About;

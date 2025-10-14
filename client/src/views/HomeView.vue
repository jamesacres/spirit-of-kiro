<template>
  <div class="home">
    <div class="scanlines"></div>
    <div class="stars"></div>
    <div class="hero">
      <div class="hero-content">
        <div class="hero-text">
          <div class="title-container">
            <h1 class="retro-title">SPIRIT OF KIRO</h1>
            <div class="subtitle">∞ INFINITE CRAFTING WORKSHOP ∞</div>
          </div>
          <div class="game-description">
            <p>Enter a world where every item is unique</p>
            <p>Craft • Combine • Create • Conquer</p>
          </div>
          <div class="button-container">
            <router-link to="/play" class="play-button">
              <span class="button-text">► START GAME</span>
            </router-link>
            <div class="insert-coin">INSERT COIN TO CONTINUE</div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-text">
      <div class="credits">A DEMO BY KIRO • POWERED BY AI</div>
    </div>
  </div>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&display=swap');

.home {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: 
    radial-gradient(circle at 20% 80%, #120458 0%, transparent 50%),
    radial-gradient(circle at 80% 20%, #421a5c 0%, transparent 50%),
    radial-gradient(circle at 40% 40%, #0f0f23 0%, transparent 50%),
    linear-gradient(135deg, #0a0a0a 0%, #1a0033 50%, #000000 100%);
  color: #00ff41;
  text-align: center;
  font-family: 'Orbitron', monospace;
  position: relative;
  overflow: hidden;
}

/* Retro scanlines effect */
.scanlines {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: repeating-linear-gradient(
    0deg,
    transparent,
    transparent 2px,
    rgba(0, 255, 65, 0.03) 2px,
    rgba(0, 255, 65, 0.03) 4px
  );
  pointer-events: none;
  z-index: 1;
}

/* Animated stars background */
.stars {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: 
    radial-gradient(2px 2px at 20px 30px, #00ff41, transparent),
    radial-gradient(2px 2px at 40px 70px, rgba(255, 255, 255, 0.8), transparent),
    radial-gradient(1px 1px at 90px 40px, #ff0080, transparent),
    radial-gradient(1px 1px at 130px 80px, #00ff41, transparent),
    radial-gradient(2px 2px at 160px 30px, rgba(255, 255, 255, 0.6), transparent);
  background-repeat: repeat;
  background-size: 200px 100px;
  animation: stars-move 20s linear infinite;
  opacity: 0.6;
}

@keyframes stars-move {
  from { transform: translateY(0px); }
  to { transform: translateY(-100px); }
}

.hero {
  padding: 2rem;
  width: 100%;
  max-width: 900px;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  z-index: 2;
}

.hero-content {
  display: flex;
  align-items: center;
  justify-content: center;
}

.hero-text {
  text-align: center;
}

.title-container {
  margin-bottom: 3rem;
}

.retro-title {
  font-size: 5rem;
  font-weight: 900;
  margin-bottom: 1rem;
  color: #00ff41;
  text-shadow: 
    0 0 10px #00ff41,
    0 0 20px #00ff41,
    0 0 30px #00ff41,
    0 0 40px #00ff41;
  letter-spacing: 0.1em;
  animation: glow-pulse 2s ease-in-out infinite alternate;
  font-family: 'Orbitron', monospace;
}

@keyframes glow-pulse {
  from {
    text-shadow: 
      0 0 10px #00ff41,
      0 0 20px #00ff41,
      0 0 30px #00ff41,
      0 0 40px #00ff41;
  }
  to {
    text-shadow: 
      0 0 5px #00ff41,
      0 0 10px #00ff41,
      0 0 15px #00ff41,
      0 0 20px #00ff41;
  }
}

.subtitle {
  font-size: 1.2rem;
  color: #ff0080;
  font-weight: 400;
  letter-spacing: 0.2em;
  text-shadow: 0 0 10px #ff0080;
  animation: flicker 3s linear infinite;
}

@keyframes flicker {
  0%, 19%, 21%, 23%, 25%, 54%, 56%, 100% {
    opacity: 1;
  }
  20%, 24%, 55% {
    opacity: 0.4;
  }
}

.game-description {
  margin: 2rem 0;
  font-size: 1.1rem;
  color: #00ccff;
  line-height: 1.6;
}

.game-description p {
  margin: 0.5rem 0;
  text-shadow: 0 0 5px #00ccff;
}

.button-container {
  margin-top: 3rem;
}

.play-button {
  display: inline-block;
  padding: 1.5rem 4rem;
  font-size: 1.4rem;
  font-weight: 700;
  text-decoration: none;
  color: #000000;
  background: linear-gradient(45deg, #00ff41, #00cc33);
  border: 3px solid #00ff41;
  border-radius: 0;
  transition: all 0.3s ease;
  font-family: 'Orbitron', monospace;
  letter-spacing: 0.1em;
  position: relative;
  overflow: hidden;
  box-shadow: 
    0 0 20px rgba(0, 255, 65, 0.5),
    inset 0 0 20px rgba(255, 255, 255, 0.1);
}

.play-button:hover {
  background: linear-gradient(45deg, #00cc33, #00ff41);
  box-shadow: 
    0 0 30px rgba(0, 255, 65, 0.8),
    inset 0 0 30px rgba(255, 255, 255, 0.2);
  transform: translateY(-2px);
}

.play-button:active {
  transform: translateY(0);
}

.button-text {
  position: relative;
  z-index: 1;
}

.insert-coin {
  margin-top: 2rem;
  font-size: 0.9rem;
  color: #ffff00;
  font-weight: 400;
  letter-spacing: 0.15em;
  animation: blink 1.5s linear infinite;
}

@keyframes blink {
  0%, 50% { opacity: 1; }
  51%, 100% { opacity: 0.3; }
}

.footer-text {
  position: absolute;
  bottom: 2rem;
  width: 100%;
  z-index: 2;
}

.credits {
  font-size: 0.8rem;
  color: #666;
  letter-spacing: 0.1em;
  font-weight: 400;
}

@media (max-width: 768px) {
  .retro-title {
    font-size: 3rem;
  }

  .subtitle {
    font-size: 1rem;
  }

  .game-description {
    font-size: 1rem;
  }

  .play-button {
    padding: 1.2rem 3rem;
    font-size: 1.2rem;
  }

  .insert-coin {
    font-size: 0.8rem;
  }
}

@media (max-width: 480px) {
  .retro-title {
    font-size: 2.2rem;
  }

  .subtitle {
    font-size: 0.9rem;
  }

  .play-button {
    padding: 1rem 2.5rem;
    font-size: 1.1rem;
  }
}
</style>
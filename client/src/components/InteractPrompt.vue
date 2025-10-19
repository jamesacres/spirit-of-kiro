<template>
  <div 
    v-if="show" 
    class="interact-prompt"
    :style="{ top: topOffset }"
  >
    {{ text }}
  </div>
</template>

<script setup lang="ts">
import { useGameStore } from '../stores/game'

interface Props {
  show: boolean
  text?: string
  topOffset?: string
}

const props = withDefaults(defineProps<Props>(), {
  text: 'E',
  topOffset: 'calc(-1.1 * v-bind(tileSize) * 1px)'
})

const gameStore = useGameStore()
const { tileSize } = gameStore
</script>

<style scoped>
.interact-prompt {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  font-size: calc(0.5 * v-bind(tileSize) * 1px);
  font-weight: bold;
  color: white;
  text-shadow: 0 0 5px white;
  animation: pulse 1s infinite;
  background-color: black;
  padding: calc(0.1 * v-bind(tileSize) * 1px) calc(0.1 * v-bind(tileSize) * 1px);
  border-radius: calc(0.08 * v-bind(tileSize) * 1px);
  z-index: 1;
  line-height: 1;
}

@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.7;
  }
}
</style>
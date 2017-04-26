package utils

import java.util.Random
import java.util.List

class Randoms {
	
	static val random = new Random
	
	def static nextInt(int bound) {
		random.nextInt(bound)
	}
	
	def static randomBetween(Integer min, Integer max) {
		val difference = max - min + 1
		random.nextInt(difference) + min
	}
	
	def static String randomIn(List<String> lista) {
		lista.get(random.nextInt(lista.size))
	}
}
import hector.*
import cultivos.*
import wollok.game.* 



object juegoGranja {
	var personajeActual = hector 
	
	method configurarTeclado(){
		keyboard.s().onPressDo({game.say(hector, "hola Gente")})keyboard.s().onPressDo({game.say(hector, "hola gente")})
		keyboard.o().onPressDo({hector.position(new Position(x = 0, y = 0))})
		keyboard.n().onPressDo({hector.plantarMaiz() })
		keyboard.t().onPressDo({hector.plantarTrigo() })
		keyboard.r().onPressDo({hector.regarPlanta() })
		keyboard.c().onPressDo({hector.cosecharPlanta() })
		
		
		self.configurarMovimientos()
	}
	method configurarMovimientos(){
		keyboard.up().onPressDo({
			if (personajeActual.position().y() < game.height() - 1){
				personajeActual.position(personajeActual.position().up(1)) } })
		keyboard.down().onPressDo({	
			if(personajeActual.position().y() < game.height() - 1){
				personajeActual.position(personajeActual.position().down(1)) } })
		keyboard.left().onPressDo({	
			if(personajeActual.position().x() < game.height() - 1){
				personajeActual.position(personajeActual.position().left(1)) } })
		keyboard.right().onPressDo({	
			if(personajeActual.position().x() < game.height() - 1){
				personajeActual.position(personajeActual.position().right(1)) } })
		
		
		
	}
	method configurarPersonajes(){
		game.addVisual(hector)
		game.addVisual(oso)
	}
	method configurarColisiones(){
		game.whenCollideDo(oso,{ objeto => objeto.theChocoElOso() })
	}
}

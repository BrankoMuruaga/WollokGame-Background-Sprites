import wollok.game.*
import background.*
import character.*
import personaje.*
import fondo.*


object personajeActual{
	const property personajes = [mago, soldado, guerreroElemental]
	
	var property personaje = mago
}

object controles {
	method iniciarControles(){
		const personajes = personajeActual.personajes()
		const indexPersonajes = (0.. personajes.size()-1)
		var index = indexPersonajes.find{i => personajes.get(i).equals(personajeActual.personaje())} + 1
		
		
		keyboard.right().onPressDo{
				personajeActual.personaje().correr()
				
		}
		
		keyboard.left().onPressDo{
				personajeActual.personaje().pararse()	
		}
		
		keyboard.space().onPressDo{
				personajeActual.personaje().atacar()	
		}
		
		
		
		keyboard.c().onPressDo{
			if(!personajeActual.personajes().isEmpty()){
				personajeActual.personaje().detener()
				personajeActual.personaje(personajes.get(index % personajes.size()))
				index++ 
				personajeActual.personaje().iniciar()
			}
		}
		
		keyboard.d().onPressDo{
			fondo.detenerFondo()
			personajeActual.personaje().morir()
		}
		
	}
}

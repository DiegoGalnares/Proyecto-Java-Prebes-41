import sun.net.www.content.text.plain;

public class Pockemon {
    //Atributos
    String nombre;
    String tipo;
    int vida;
    int velocidad;
    int ataque;
    int defensa;
    String estado;
    //Metodos
    public void recibirDaño(int ataqueEnemigo){
        this.vida=(this.vida)-(ataqueEnemigo-this.defensa);

    }
    public void extraPociones(Pocion pocion){
        if(pocion.tipo == "Ataque"){
            this.ataque=this.ataque+pocion.ataque;
        }else if(pocion.tipo == "Vida"){
            this.vida=this.vida+pocion.vida;
        }else if(pocion.tipo == "Vida"){
            this.defensa=this.defensa+pocion.defensa;
        }
    }
    
}

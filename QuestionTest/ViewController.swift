//
//  ViewController.swift
//  QuestionTest
//
//  Created by Maestro on 29/01/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vs_superView: UIView!
    @IBOutlet weak var img_Example: UIImageView!
    @IBOutlet weak var lbl_Pregunta: UILabel!
    
    var listaPreguntas : [Preguntas] = []
    var cont: Int!
    var finished = false
    
    override func viewWillAppear(_ animated: Bool) {
        cont = 0
        
        listaPreguntas.append(Preguntas(pregunta: "¿Ves la naranja?", imagen: "toronja", respuesta: false))
        listaPreguntas.append(Preguntas(pregunta: "¿Esta es una oveja?", imagen: "oveja", respuesta: true))
        listaPreguntas.append(Preguntas(pregunta: "¿Cual es la capital de europa?", imagen: "europa", respuesta: false))
        listaPreguntas.append(Preguntas(pregunta: "¿Existe alguien mas rapido que este tipo?", imagen: "sanik", respuesta: false))
        listaPreguntas.append(Preguntas(pregunta: "¿Ya le dijiste a tu mama que eres gay?", imagen: "gay", respuesta: false))
        listaPreguntas.append(Preguntas(pregunta: "¿Este emoji sonrie?", imagen: "smile", respuesta: true))
        listaPreguntas.append(Preguntas(pregunta: "¿Estas seguro?", imagen: "smile", respuesta: true))
        listaPreguntas.append(Preguntas(pregunta: "Du u nou da wae?", imagen: "ugandanknuck", respuesta: false))
        listaPreguntas.append(Preguntas(pregunta: "Retroalimentacion: ¿Te gusto este cuestionario?", imagen: "ebola", respuesta: false))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doTap_No(_ sender: Any) {
        cont! += 1
        ShowAnswerTransition(isCorrect: false)
    }
    
    @IBAction func doTap_Si(_ sender: Any) {
        cont! += 1
        ShowAnswerTransition(isCorrect: true)
    }
    
    func ShowAnswerTransition(isCorrect : Bool){
        var answerImage = "Test"
        if(listaPreguntas.count > cont){
            if(isCorrect == listaPreguntas[cont-1].respuesta){
                answerImage = "correct"
            } else {
                answerImage = "wrong"
            }
        } else {
            answerImage = "finish"
            finished = true
        }
        if(!finished){
            UIView.transition(with: vs_superView, duration: 0.5, options: [.    transitionFlipFromLeft], animations: {
                    self.img_Example.image = UIImage(named: answerImage)
                    self.lbl_Pregunta.text = answerImage
            }, completion: {_ in
                UIView.animate(withDuration: 1, animations: {
                    self
                    .lbl_Pregunta.center.x += 1
                }, completion: {_ in
                    UIView.transition(with: self.vs_superView, duration: 0.5, options: [.   transitionFlipFromRight], animations: {
                        self.img_Example.image = UIImage(named: self.listaPreguntas[self.cont].imagen)
                        self.lbl_Pregunta.text = self.listaPreguntas[self.cont].pregunta
                        self.lbl_Pregunta.center.x-=1
                    }, completion: nil)
                })
            })
        } else {
            UIView.transition(with: vs_superView, duration: 0.5, options: [.    transitionFlipFromLeft], animations: {
                self.img_Example.image = UIImage(named: answerImage)
                self.lbl_Pregunta.text = answerImage
            }, completion:nil)
        }
    }

}


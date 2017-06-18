//
//  ViewController.swift
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 27/02/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewChord: UIView!
    @IBOutlet weak var labelChord: UILabel!
    @IBOutlet weak var textFieldChord: UITextField!
    @IBOutlet weak var verticalSpaceTextField: NSLayoutConstraint!
    @IBOutlet weak var viewNote: ViewNote!
    
    let chordsController = ChordsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldChord.layer.borderColor = #colorLiteral(red: 0.4190416336, green: 0.3278442919, blue: 0.7069011331, alpha: 1).cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        /*
        // Do any additional setup after loading the view, typically from a nib.
        print("Am: \(Chords().isChord(word: "Am"))")
        print("F#m: \(Chords().isChord(word: "F#m"))")
        print("B#m: \(Chords().isChord(word: "B#m"))")
        
        print("Am9: \(Chords().isChord(word: "Am9"))")
        print("Am16: \(Chords().isChord(word: "Am16"))")
        print("Am10: \(Chords().isChord(word: "Am10"))")
        print("Am11: \(Chords().isChord(word: "Am11"))")
        print("Am14: \(Chords().isChord(word: "Am14"))")
        print("Am2: \(Chords().isChord(word: "Am2"))")
        print("Am6: \(Chords().isChord(word: "Am6"))")
        
        print("E#: \(Chords().isChord(word: "E#"))")
        print("Em: \(Chords().isChord(word: "Em"))")
        print("Eb9: \(Chords().isChord(word: "Eb9"))")
        print("E9b: \(Chords().isChord(word: "E9b"))")
        print("E9: \(Chords().isChord(word: "E9"))")
        
        print("A7M: \(Chords().isChord(word: "A7M"))")
        print("C9: \(Chords().isChord(word: "C9"))")
        print("E4: \(Chords().isChord(word: "E4"))")
        print("G13m: \(Chords().isChord(word: "G13m"))")
        
        print("Bbm: \(Chords().isChord(word: "Bbm"))")
        print("Cbm: \(Chords().isChord(word: "Cbm"))")
        print("Bbm7m/9: \(Chords().isChord(word: "Bbm7m/9"))")
        
        print("\nNames")
        print("Test Soldi: \(Chords().isChord(word: "Soldi"))")
        print("Test Amanda: \(Chords().isChord(word: "Amanda"))")
        print("AC: \(Chords().isChord(word: "AC"))")
        
        print("\nSus")
        print("A7sus4: \(Chords().isChord(word: "A7sus4"))")
        print("Asus4: \(Chords().isChord(word: "Asus4"))")
        print("Asus: \(Chords().isChord(word: "Asus"))")
        print("A#sus: \(Chords().isChord(word: "A#sus"))")
        print("A#sus4: \(Chords().isChord(word: "A#sus4"))")
        print("A#sus2: \(Chords().isChord(word: "A#sus2"))")
        print("Absus: \(Chords().isChord(word: "Absus"))")
        print("Absus4: \(Chords().isChord(word: "Absus4"))")
        print("Absus2: \(Chords().isChord(word: "Absus2"))")
        print("Asus2: \(Chords().isChord(word: "Asus2"))")
        print("As: \(Chords().isChord(word: "As"))")
        print("Asu: \(Chords().isChord(word: "Asu"))")
        print("Absus4: \(Chords().isChord(word: "Absus4"))")
        print("Cbsus4: \(Chords().isChord(word: "Cbsus4"))")
        print("ACbsus4: \(Chords().isChord(word: "ACbsus4"))")
        print("A#7sus4: \(Chords().isChord(word: "A#7sus4"))")
        print("Ab7sus4: \(Chords().isChord(word: "Ab7sus4"))")
        
        print("\nNumbers")
        print("A4/7: \(Chords().isChord(word: "A4/7"))")
        print("A4/7/9: \(Chords().isChord(word: "A4/7/9"))")
        print("A4/7m: \(Chords().isChord(word: "A4/7m"))")
        print("A4/7#/13: \(Chords().isChord(word: "A4/7#/13"))")
        print("A4/7/: \(Chords().isChord(word: "A4/7/"))")
        print("A4/7/A: \(Chords().isChord(word: "A4/7/A"))")
        print("A4/7m/C: \(Chords().isChord(word: "A4/7m/C"))")
        print("A4/7mb: \(Chords().isChord(word: "A4/7mb"))")
        print("A4/: \(Chords().isChord(word: "A4/"))")
        print("A#4/7/9: \(Chords().isChord(word: "A#4/7/9"))")
        print("Ab4/7/9: \(Chords().isChord(word: "Ab4/7/9"))")
        print("A#//9: \(Chords().isChord(word: "A#//9"))")
        print("Ab4/7/: \(Chords().isChord(word: "Ab4/7/"))")
        print("Ab4//: \(Chords().isChord(word: "Ab4//"))")
        print("A1: \(Chords().isChord(word: "A1"))")
        print("Am9-: \(Chords().isChord(word: "Am9-"))")
        print("Am9+: \(Chords().isChord(word: "Am9+"))")
        print("Am9/4/7: \(Chords().isChord(word: "Am9/4/7"))")
        print("Am9+/6: \(Chords().isChord(word: "Am9+/6"))")
        print("Am9+/: \(Chords().isChord(word: "Am9+/"))")
        
        print("\nDim")
        print("Adim: \(Chords().isChord(word: "Adim"))")
        print("A#dim: \(Chords().isChord(word: "A#dim"))")
        print("Abdim: \(Chords().isChord(word: "Abdim"))")
        print("Cbdim7: \(Chords().isChord(word: "Cbdim7"))")
        print("Ddim7: \(Chords().isChord(word: "Ddim7"))")
        print("Dbdim7: \(Chords().isChord(word: "Dbdim7"))")
        print("D#dim7: \(Chords().isChord(word: "D#dim7"))")
        print("D#dim6: \(Chords().isChord(word: "D#dim6"))")
        print("D#dim9: \(Chords().isChord(word: "D#dim9"))")
        print("D#dim13: \(Chords().isChord(word: "D#dim13"))")
        print("Abd: \(Chords().isChord(word: "Abd"))")
        print("Abdi: \(Chords().isChord(word: "Abdi"))")
        
        print("\nº")
        print("Aº: \(Chords().isChord(word: "Aº"))")
        print("Abº: \(Chords().isChord(word: "Abº"))")
        print("A#º: \(Chords().isChord(word: "A#º"))")
        print("Aº7: \(Chords().isChord(word: "Aº7"))")
        print("Aºb: \(Chords().isChord(word: "Aºb"))")
        print("Aº#: \(Chords().isChord(word: "Aº#"))")
        
        print("\nMeio diminuto")
        print("Am5-/7: \(Chords().isChord(word: "Am5-/7"))")
        print("Am6: \(Chords().isChord(word: "Am6"))")
        print("Am5+/7: \(Chords().isChord(word: "Am5+/7"))")
        print("Am6+7: \(Chords().isChord(word: "Am6+7"))")
        print("Am5-/: \(Chords().isChord(word: "Am5-/"))")
        print("Aºm5-7/: \(Chords().isChord(word: "Aºm5-7/"))")
        print("A#m5-/7: \(Chords().isChord(word: "A#m5-/7"))")
        print("Abm5-/7: \(Chords().isChord(word: "Abm5-/7"))")
        
        print("\nSétima Maior")
        print("Bm7M: \(Chords().isChord(word: "Bm7M"))")
        
        print("\nLow")
        print("E/G#: \(Chords().isChord(word: "E/G#"))")
        print("A/C#: \(Chords().isChord(word: "A/C#"))")
        print("A/G: \(Chords().isChord(word: "A/G"))")
        print("Eb/G: \(Chords().isChord(word: "Eb/G"))")
        print("A#/D: \(Chords().isChord(word: "A#/D"))")
        print("Am/G: \(Chords().isChord(word: "Am/G"))")
        print("Am9/G: \(Chords().isChord(word: "Am9/G"))")
        print("Am9+/G: \(Chords().isChord(word: "Am9+/G"))")
        print("Bb7M/A: \(Chords().isChord(word: "Bb7M/A"))")
        print("A#7M/D: \(Chords().isChord(word: "A#7M/D"))")
        print("B7M/A: \(Chords().isChord(word: "B7M/A"))")        
        
        print("\nOceano")
        print("A#º: \(Chords().isChord(word: "A#º"))")
        print("A7: \(Chords().isChord(word: "A7"))")
        print("A7(13-): \(Chords().isChord(word: "A7(13-)"))")
        print("A7(4): \(Chords().isChord(word: "A7(4)"))")
        print("Am7: \(Chords().isChord(word: "Am7"))")
        print("B7(9-): \(Chords().isChord(word: "B7(9-)"))")
        print("Bb7M: \(Chords().isChord(word: "Bb7M"))")
        print("Bm: \(Chords().isChord(word: "Bm"))")
        print("Bm6: \(Chords().isChord(word: "Bm6"))")
        print("Bm7: \(Chords().isChord(word: "Bm7"))")
        print("Bm7M: \(Chords().isChord(word: "Bm7M"))")
        print("C: \(Chords().isChord(word: "C"))")
        print("C7(4/9): \(Chords().isChord(word: "C7(4/9)"))")
        print("C7(9): \(Chords().isChord(word: "C7(9)"))")
        print("D: \(Chords().isChord(word: "D"))")
        print("D7(9): \(Chords().isChord(word: "D7(9)"))")
        print("Dm: \(Chords().isChord(word: "Dm"))")
        print("E7(9): \(Chords().isChord(word: "E7(9)"))")
        print("Em7(5-): \(Chords().isChord(word: "Em7(5-)"))")
        print("Em7(9): \(Chords().isChord(word: "Em7(9)"))")
        print("F#m7: \(Chords().isChord(word: "F#m7"))")
        print("F7M: \(Chords().isChord(word: "F7M"))")
        print("G7M: \(Chords().isChord(word: "G7M"))")
        print("Gm7: \(Chords().isChord(word: "Gm7"))")
        
        print("\nGarota de Ipanema")
        print("Ab7(11+): \(Chords().isChord(word: "Ab7(11+)"))")
        print("Am7: \(Chords().isChord(word: "Am7"))")
        print("Am7(11): \(Chords().isChord(word: "Am7(11)"))")
        print("B7(9): \(Chords().isChord(word: "B7(9)"))")
        print("C7(9-): \(Chords().isChord(word: "C7(9-)"))")
        print("D7(9): \(Chords().isChord(word: "D7(9)"))")
        print("D7(9-): \(Chords().isChord(word: "D7(9-)"))")
        print("Eb7(9): \(Chords().isChord(word: "Eb7(9)"))")
        print("F#7M: \(Chords().isChord(word: "F#7M"))")
        print("F#m7: \(Chords().isChord(word: "F#m7"))")
        print("F7M: \(Chords().isChord(word: "F7M"))")
        print("G7(13): \(Chords().isChord(word: "G7(13)"))")
        print("Gb7(11+): \(Chords().isChord(word: "Gb7(11+)"))")
        print("Gm7: \(Chords().isChord(word: "Gm7"))")
        print("Gm7(11): \(Chords().isChord(word: "Gm7(11)"))")
        
        print("\nSamba de uma nota só")
        print("A6: \(Chords().isChord(word: "A6"))")
        print("Am6: \(Chords().isChord(word: "Am6"))")
        print("Am7: \(Chords().isChord(word: "Am7"))")
        print("B7: \(Chords().isChord(word: "B7"))")
        print("Bb7(#11): \(Chords().isChord(word: "Bb7(#11)"))")
        print("Bm7(11): \(Chords().isChord(word: "Bm7(11)"))")
        print("C7/9: \(Chords().isChord(word: "C7/9"))")
        print("D7/9: \(Chords().isChord(word: "D7/9"))")
        print("E: \(Chords().isChord(word: "E"))")
        print("F#7: \(Chords().isChord(word: "F#7"))")
        print("F#m7: \(Chords().isChord(word: "F#m7"))")
        print("F#m7/5-: \(Chords().isChord(word: "F#m7/5-"))")
        print("F7(#11): \(Chords().isChord(word: "F7(#11)"))")
        print("F7M: \(Chords().isChord(word: "F7M"))")
        print("G#m7: \(Chords().isChord(word: "G#m7"))")
        print("G7: \(Chords().isChord(word: "G7"))")
        print("G7M: \(Chords().isChord(word: "G7M"))")
        print("Gm7: \(Chords().isChord(word: "Gm7"))")
        
        print("\n Águas de março")
        print("Ab: \(Chords().isChord(word: "Ab"))")
        print("Ab7(13): \(Chords().isChord(word: "Ab7(13)"))")
        print("B: \(Chords().isChord(word: "B"))")
        print("B/Bb: \(Chords().isChord(word: "B/Bb"))")
        print("Bb/Ab: \(Chords().isChord(word: "Bb/Ab"))")
        print("Bb6: \(Chords().isChord(word: "Bb6"))")
        print("Bb7: \(Chords().isChord(word: "Bb7"))")
        print("Bb7(13): \(Chords().isChord(word: "Bb7(13)"))")
        print("Bb7M: \(Chords().isChord(word: "Bb7M"))")
        print("Bb7M/F: \(Chords().isChord(word: "Bb7M/F"))")
        print("Bbm/Db: \(Chords().isChord(word: "Bbm/Db"))")
        print("Bbm6: \(Chords().isChord(word: "Bbm6"))")
        print("Bbm7: \(Chords().isChord(word: "Bbm7"))")
        print("C: \(Chords().isChord(word: "C"))")
        print("C/Bb: \(Chords().isChord(word: "C/Bb"))")
        print("C7/E: \(Chords().isChord(word: "C7/E"))")
        print("Db/B: \(Chords().isChord(word: "Db/B"))")
        print("Db7/B: \(Chords().isChord(word: "Db7/B"))")
        print("E/D: \(Chords().isChord(word: "E/D"))")
        print("Eb6: \(Chords().isChord(word: "Eb6"))")
        print("Eb6/G: \(Chords().isChord(word: "Eb6/G"))")
        print("Eb7(9): \(Chords().isChord(word: "Eb7(9)"))")
        print("Eb7M(9): \(Chords().isChord(word: "Eb7M(9)"))")
        print("Ebm/Gb: \(Chords().isChord(word: "Ebm/Gb"))")
        print("Ebm6: \(Chords().isChord(word: "Ebm6"))")
        print("Ebm6/Gb: \(Chords().isChord(word: "Ebm6/Gb"))")
        print("Ebm7: \(Chords().isChord(word: "Ebm7"))")
        print("Fadd4: \(Chords().isChord(word: "Fadd4"))")
        print("Fadd9: \(Chords().isChord(word: "Fadd9"))")
        print("Fm: \(Chords().isChord(word: "Fm"))")
        print("Fm6: \(Chords().isChord(word: "Fm6"))")
        print("G#/E: \(Chords().isChord(word: "G#/E"))")
        print("G/E: \(Chords().isChord(word: "G/E"))")
        print("Gm13+: \(Chords().isChord(word: "Gm13+"))")
        print("Gm6: \(Chords().isChord(word: "Gm6"))")
        
        print("\nFly me to the moon")
        print("A7/b9: \(Chords().isChord(word: "A7/b9"))")
        print("Am7: \(Chords().isChord(word: "Am7"))")
        print("Am9: \(Chords().isChord(word: "Am9"))")
        print("B6: \(Chords().isChord(word: "B6"))")
        print("Bb6: \(Chords().isChord(word: "Bb6"))")
        print("Bm7: \(Chords().isChord(word: "Bm7"))")
        print("Bm7/b5: \(Chords().isChord(word: "Bm7/b5"))")
        print("C6: \(Chords().isChord(word: "C6"))")
        print("C6/9: \(Chords().isChord(word: "C6/9"))")
        print("Cm9: \(Chords().isChord(word: "Cm9"))")
        print("Cmaj7: \(Chords().isChord(word: "Cmaj7"))")
        print("Dm7: \(Chords().isChord(word: "Dm7"))")
        print("Dm7/C: \(Chords().isChord(word: "Dm7/C"))")
        print("E7: \(Chords().isChord(word: "E7"))")
        print("E7/b9: \(Chords().isChord(word: "E7/b9"))")
        print("Em7/b5: \(Chords().isChord(word: "Em7/b5"))")
        print("F7: \(Chords().isChord(word: "F7"))")
        print("Fdim7: \(Chords().isChord(word: "Fdim7"))")
        print("G7: \(Chords().isChord(word: "G7"))")
        print("G7/b9: \(Chords().isChord(word: "G7/b9"))")
        print("G9: \(Chords().isChord(word: "G9"))")
        
        print("\nSentences")
        print("C D E F G A B: \(Chords().isChord(from: "C D E F G A B"))")
        print("C D E F aqui G A B: \(Chords().isChord(from: "C D E F aqui G A B"))")
        print("C Dsu E F G A B: \(Chords().isChord(from: "C Dsu E F G A B"))")
        
        print("\nTexts")
        let garota = "F7M                                       G7(13)\nOlha que coisa mais linda mais cheia de graça\nGm7\nÉ ela menina que vem e que passa\nC7(9-)                Am7(11)   Ab7(11+)    Gm7(11)   Gb7(11+)\nNum doce balanço a caminho do mar"
        print("Garota de Ipanema: \(Chords().chords(from: garota))")
        
        let song = "Violão 1$$$$$$      Bm        G         D             A$$D#|-------5-|-------5-|------5--3-2-----------|$$A#|---3-----|---3-----|---3---------5--3-2----|$$F#|-----4---|-----4---|-----4---------------2-|$$C#|---------|---------|-0---------------------|$$G#|-2-------|---------|-----------------------|$$D#|---------|-3-------|-----------------------|$$$$$$Violão 2$$$$$$            Bm                    G                  D             A$$D#|-------------------|------------------|-----------------|-----------------|$$A#|-------------------|------------------|-----------------|-----------------|$$F#|-------2-------2---|-------2-------2--|--------2--------|-----------------|$$C#|---4-------4-------|---4-------4------|----4-------4----|-2-4-2---2-4-2---|$$G#|-2---2---2---2-----|------------------|--5---5---5---5--|-------5-------5-|$$D#|-------------------|-3---3---3---3----|---------------- |-----------------|$$$$$$Bm      G               D      A$$Cada minuto aqui é uma chance de provar o que eu mais quero$$Bm      G           D                  A$$E ainda se eu conseguisse uma máquina que parasse o tempo$$Bm        G            D$$Você estaria ao meu alcance?$$ A$$Não importa, eu te espero$$Bm                 G                         D$$Se eu pudesse escrever a história das minhas horas$$             A$$Uma a uma seria do seu lado$$Bm               G                     D$$Eu contaria todo dia uma história diferente$$            A$$Eu criaria frases pra sempre$$$$G        A         Bm$$Eu cantaria notas de clara esperança$$G         A        Bm$$E seu sorriso viraria poesia$$$$Bm      G               D      A$$Cada minuto aqui é uma chance de provar o que eu mais quero$$Bm      G           D                  A$$E ainda se eu conseguisse uma máquina que parasse o tempo$$Bm        G            D$$Você estaria ao meu alcance?$$A$$Não importa, eu te espero$$Bm             G              D$$Eu criaria uma ONG com seu nome$$                  A$$Eu tocaria acordeon na sua janela$$Bm               G$$Te pagaria um café na rue de La Paix$$D                  A$$Te compraria um imóvel no Mairie d'Issy$$Bm                G                       D$$Se eu tivesse o domínio do equilíbrio e pudesse voar,$$     A$$te traria a lua$$Bm               G$$Dominaria o meu medo de altura$$        D             A$$e buscaria no espaço cada estrela$$$$G       A         Bm$$Inverteria o princípio da inércia$$G          A          Bm$$Eu encolheria a Terra e te daria$$$$Bm      G               D      A$$Cada minuto aqui é uma chance de provar o que eu mais quero$$Bm      G           D                  A$$E ainda se eu conseguisse uma máquina que parasse o tempo$$Bm        G            D$$Você estaria ao meu alcance?$$ A                         Bm  G D A$$Não importa, eu te espero"
        print("Song: \(Chords().chords(from: song.replacingOccurrences(of: "$$", with: "\n"), noRepeat: true))")
        
        let song2 = "Introdução: Dm G C F Dm G C G $$$$Dm    G              C$$Esqueço tudo o que passou$$       F$$Nada importa pra mim$$Dm      G                  C$$O que eu falei, o que você diz,$$      F$$o que houve de ruim$$Dm    F        G$$Daquilo nada sobrou$$Dm   G                C$$Agora entendo o que você $$         F$$disse um dia sentir $$Dm     G               C        F$$Há certas coisas que a gente precisa $$Dm           F         G $$medir pra perceber o valor$$Am              Em $$E aproveito o momento $$         Am                   G$$pra te dizer que eu já te esperava$$Am           Em $$Abandono o silêncio, $$         F                 G$$pra te dizer que a chuva passou$$C       G               Dm $$Eu não quero te ouvir dizer$$               F           C$$que a nossa história não valeu$$     G               Dm $$Eu espero que você entenda $$            F                   $$que os meus olhos são só seus$$(C G Dm F) $$Oh oh oh oh!$$$$Solo: C G Dm F C G F G $$$$Am              Em $$E aproveito o momento $$         Am                   G$$pra te dizer que eu já te esperava$$Am           Em $$Abandono o silêncio, $$         F                 G$$pra te dizer que a chuva passou$$C       G               Dm $$Eu não quero te ouvir dizer$$               F           C$$que a nossa história não valeu$$     G               Dm $$Eu espero que você entenda $$            F                   $$que os meus olhos são só seus$$C       G               Dm $$Eu não quero te ouvir dizer$$               F           C$$que a nossa história não valeu$$     G               Dm $$Eu espero que você entenda $$            F                   $$que os meus olhos são só seus$$(C G Dm F) (2x) C $$Oh oh oh oh! (2x)"
        print("Song 2: \(Chords().chords(from: song2.replacingOccurrences(of: "$$", with: "\n"), noRepeat: true))")
        */
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textString = textField.text as NSString?
        let text = textString?.replacingCharacters(in: range, with: string)
        labelChord.text = text
        
        if text?.isEmpty ?? false {
            
            viewChord.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            viewNote.isHidden = true
            
            return true
        }
        
        self.viewNote.clearNote()
        if Chords().isChord(word: text!) {
            viewNote.isHidden = false
//            viewChord.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            if let notes = chordsController.drawNote(fromText: text!) {
                
//                if let pestana = notes.1 {
                let _ = self.viewNote.drawNotes(notes.0, pestana: notes.1, houseHidden: notes.1?.0, letterHouseToPlay: notes.2?.0, houseToPLay: notes.2?.1, stringsToPlay: notes.3)
//                } else {
//                    let _ = self.viewNote.drawNotes(notes.0)
//                }
            } else {
                viewNote.isHidden = true    
            }
        } else {
            viewNote.isHidden = true
//            viewChord.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            verticalSpaceTextField.constant = keyboardSize.height - (self.tabBarController?.tabBar.frame.size.height ?? 0)
            let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 1
            UIView.animate(withDuration: animationDuration, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        verticalSpaceTextField.constant = 0
        let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 1
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
        })
    }

}


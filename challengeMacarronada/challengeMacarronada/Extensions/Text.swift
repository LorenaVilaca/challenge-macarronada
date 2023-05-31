import SwiftUI

extension Text {
    
    func headerOne() -> Text {
        return self
            .font(.system(size: 36, weight: .bold))
            .foregroundColor(.white)
    }
    
    func headerTwo() -> Text {
        return self
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
    }
    
    func headerThree() -> Text {
        return self
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
    }
    
    func headerOnboarding() -> Text {
        return self
            .font(.system(size: 20, weight: .bold))
    }
    
    func FEM_menuBar() -> Text {
        return self
            .font(.system(size: 18, weight: .bold))
    }
    
    func textOnboarding() -> Text {
        return self
            .font(.system(size: 16, weight: .medium))
    }
    
    func textRegular() -> Text {
        return self
            .font(.system(size: 16, weight: .regular))
    }
    
    func textButtons() -> Text {
        return self
            .font(.system(size: 17, weight: .semibold))
    }
    
    func secondTitle() -> Text {
        return self
            .font(.system(size: 20, weight: .bold))
    }
    
    static let texts = Texts()
    
}

struct Texts {
    
    let titleBPT = "BPTime"
    let fillInSignals = "Preencha seus sinais"
    let yourChart = "Seu gráfico"
    let timeNow = "Horário atual: "
    let hour = "Hora"
    let value = "Valor"
    let focus = "Foco"
    let energy = "Energia"
    let motivation = "Motivação"
    let date = "Data"
    let empty = ""
    let greeting = "Boas vindas!"
    let textOnboardingOne = "Este é o guia do seu Ritmo Biológico Ideal (BPT). Descubra o seu BPT e usufrua do máximo de desempenho em todas as áreas da sua vida. Aqui começa a sua jornada rumo a produtividade e bem estar máximo."
    let nextButton = "Próximo"
    let textOnboardingTwo = "Permita que o BPTime lhe mande notificações lembrando o exato momento de preencher as informações necessárias para o cálculo do seu BPT."
    let notification = "Não perca a hora, use as notificações!"
    let notNow = "Agora não"
    let enable = "Habilitar"
    let allow = "Permitir"
    let textOnboardingThree = "Experimente nosso calendário e maximize a sua produtividade acompanhando sua energia , foco e motivação podendo assim acompanhar seu desempenho, identificando seus padrões de pico e assim melhorar a sua eficiência."
    let data = "Guardar os dados do seu BPT no calendário"
    let signs = "Preencha seus sinais"
    let send = "Enviar"
    let add = "Adicionar"
    let knowMore = "Saiba mais"
    let whatBPT = "O que é o BPT?"
    let nemo = "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma."
}

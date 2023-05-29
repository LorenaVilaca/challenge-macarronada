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
    
    func textOnboarding() -> Text {
        return self
            .font(.system(size: 16, weight: .medium))
    }
    
    func textButtons() -> Text {
        return self
            .font(.system(size: 17, weight: .semibold))
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
    let greeting = "Olá, seja bem vindo!"
    let textOnboardingOne = "Este  é o seu guia para o seu Ritmo Biológico Ideal, Descubra o seu BPT e alcance o máximo de desempenho em todas as áreas  da sua vida. Aqui começa a sua jornada rumo a produtividade e bem estar máximo."
    let nextButton = "Próximo"
    let textOnboardingTwo = "Permita que o BPTime lhe mande notificações e lembraremos o exato momento para você preencher as informações necessárias para o cálculo do seu BPT."
    let notification = "Não perca a hora com as notificações!"
    let notNow = "Agora não"
    let allow = "Permitir"
    let textOnboardingThree = "Experimente nosso calendário e maximize a sua produtividade acompanhando sua energia , foco e motivação podendo assim acompanhar seu desempenho, identificando seus padrões de pico e assim melhorar a sua eficiência."
    let data = "Guardar os dados do seu BPT no calendário"
    
}

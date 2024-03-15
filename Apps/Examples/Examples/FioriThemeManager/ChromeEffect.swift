import FioriThemeManager
import SwiftUI

struct ChromeEffect: View {
    let text = """
    Afrikaans: Hallo
    Albanian: Përshëndetje
    Amharic: ሰላም (pronounced "salam")
    Arabic: مرحبا (pronounced "marhaba")
    Armenian: Բարև (pronounced "barev")
    Azerbaijani: Salam
    Basque: Kaixo
    Bengali: নমস্কার (pronouncd "nomoshkar")
    Bhutanese: Kuzu zangpo la
    Bosnian: Zdravo
    Bulgarian: Здравейте (pronounced "zdraveĭte")
    Burmese: ဟယ်လို (pronounced "hailo")
    Cambodian/Khmer: ជំរាបសួរ (pronounced "chomreabsuor")
    Cantonese Chinese: 哈囉 (pronounced "ha lo")
    Chichewa: Moni
    Croatian: Bok
    Czech: Ahoj
    Danish: Hej
    Dutch: Hallo
    English: Hello
    Estonian: Tere
    Farsi/Persian: سلام (pronounced "salam")
    Fijian: Bula
    Finnish: Hei
    French: Bonjour
    Georgian: გამარჯობა (pronounced "gamardjoba")
    German: Hallo
    Greek: Γεια σας (pronounced "geia sas")
    Hausa: Sannu
    Hawaiian: Aloha
    Hebrew: שלום (pronounced "shalom")
    Hmong: Nyob zoo
    Hungarian: Szia
    Icelandic: Halló
    Igbo: Ndewo
    Indonesian: Halo
    Italian: Ciao
    Japanese: こんにちは (pronounced "konnichiwa")
    Kannada: ಹಲೋ (pronounced "halo")
    Kazakh: Сәлеметсіз бе (pronounced "salemetsiz be")
    Khmu: ສະບາຍດີ (pronounced "sabaidee")
    Kinyarwanda: Muraho
    Kiribati: Moa oti
    Korean: 안녕하세요 (pronounced "annyeonghaseyo")
    Kyrgyz: Салам (pronounced "salam")
    Lao: ສະບາຍດີ (pronounced "sabaidee")
    Latvian: Sveiki
    Lithuanian: Sveiki
    Luganda: Wabula
    Macedonian: Здраво (pronounced "zdravo")
    Malagasy: Manao ahoana
    Malay: Hai
    Malayalam: നമസ്കാരം (pronounced "namaskaram")
    Mandarin Chinese: 你好 (pronounced "nǐ hǎo")
    Maori: Kia ora
    Marshallese: Yokwe
    Mongolian: Сайн байна уу (pronounced "sain baina uu")
    Ndebele: Sawubona
    Nepali: नमस्ते (pronounced "namaste")
    Norwegian: Hei
    Nyanja: Moni
    Oromo: Akkam
    Polish: Cześć
    Portuguese: Olá
    Punjabi: ਸਤ ਸ੍ਰੀ ਅਕਾਲ (pronounced "sat sri akaal")
    Romanian: Salut
    Russian: Здравствуйте (pronounced "zdravstvuyte")
    Samoan: Talofa
    Serbian: Здраво (pronounced "zdravo")
    Sesotho: Lumela (pronounced "dumela")
    Setswana: Dumela
    Shona: Mhoro
    Sinhala: හෙලෝ (pronounced "helo")
    Slovak: Ahoj
    Slovenian: Živijo
    Somali: Salaam alaykum
    Spanish: Hola
    Sranan Tongo: Odi
    Swahili: Habari
    Swati: Sawubona
    Swedish: Hej
    Tagalog/Filipino: Kamusta
    Tahitian: Ia ora na
    Tajik: Салом (pronounced "salam")
    Tamil: வணக்கம் (pronounced "vanakkam")
    Telugu: నమస్తే (pronounced "namaste")
    Thai: สวัสดี (pronounced "sawatdee")
    Tigrinya: ሰላም (pronounced "salam")
    Tongan: Mālō e lelei
    Turkish: Merhaba
    Turkmen: Salam
    Ukrainian: Вітаю (pronounced "vitayu")
    Urdu: سلام (pronounced "salam")
    Uzbek: Salom
    Vietnamese: Xin chào
    Wolof: Salam
    Xhosa: Molo
    Xitsonga: Avuxeni
    Yoruba: Bawo ni
    Zulu: Sawubona
    """
    var body: some View {
        ZStack {
            Text(self.text)
                .background(Color.preferredColor(.primaryGroupedBackground))
            VStack {
                Spacer()
                Text("ultraThinkMaterial")
                    .font(.title)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                Spacer()
                Text("thinMaterial")
                    .font(.title)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(.thinMaterial)
                
                Spacer()
                Text("chrome")
                    .font(.title)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.preferredColor(.chrome))
                Spacer()
                Text("chromeSecondary")
                    .font(.title)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.preferredColor(.chromeSecondary))
                Spacer()
                
                ZStack {
                    VisualEffectView(effect: UIBlurEffect(style: .light))
                    Text("Blur Effect + Red 0.4")
                        .font(.title)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.4))
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)

                Spacer()
                ZStack {
                    VisualEffectView(effect: UIBlurEffect(style: .light))
                    Text("Blur Effect + Chrome 0.2")
                        .font(.title)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.preferredColor(.chrome).opacity(0.2))
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)

                Spacer()
                ZStack {
                    VisualEffectView(effect: UIBlurEffect(style: .light))
                    Text("Blur Effect Only")
                        .font(.title)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                Spacer()
            }
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = self.effect }
}

#Preview {
    ChromeEffect()
}

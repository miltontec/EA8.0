//+------------------------------------------------------------------+
//| CommonStructures.mqh - Estructuras Comunes del Sistema          |
//| Definiciones compartidas entre múltiples módulos                |
//+------------------------------------------------------------------+
#ifndef COMMON_STRUCTURES_MQH
#define COMMON_STRUCTURES_MQH

//+------------------------------------------------------------------+
//| Enumeración de Dirección de Voto                                |
//+------------------------------------------------------------------+
enum ENUM_VOTE_DIRECTION {
    VOTE_NEUTRAL = 0,   // Sin dirección clara
    VOTE_BUY     = 1,   // Voto de compra
    VOTE_SELL    = -1   // Voto de venta
};

//+------------------------------------------------------------------+
//| Estructura de Emoción de Mercado                                |
//+------------------------------------------------------------------+
struct MarketEmotion {
    double fear;           // Nivel de miedo (0-1)
    double greed;          // Nivel de codicia (0-1)
    double uncertainty;    // Nivel de incertidumbre (0-1)
    double excitement;     // Nivel de excitación (0-1)

    void Initialize() {
        fear = 0.5;
        greed = 0.5;
        uncertainty = 0.5;
        excitement = 0.5;
    }
};

//+------------------------------------------------------------------+
//| Estructura de Memoria de Consenso                               |
//+------------------------------------------------------------------+
struct ConsensusMemory {
    ulong consensus_id;
    ulong associated_ticket;
    datetime timestamp;
    double consensus_strength;
    int agent_count;
    ENUM_VOTE_DIRECTION direction;
    bool was_successful;
    double emotional_score;
    double profit_result;
    int negotiation_rounds;
    string dominant_agent;
    double agreement_level;
    double profit_points;
    int duration_bars;
    double max_favorable_excursion;
    double max_adverse_excursion;

    // Arrays de agentes
    string participating_agents[5];
    double agent_confidences[5];
    ENUM_VOTE_DIRECTION agent_votes[5];

    void Initialize() {
        consensus_id = 0;
        associated_ticket = 0;
        timestamp = 0;
        consensus_strength = 0.0;
        agent_count = 0;
        direction = VOTE_NEUTRAL;
        was_successful = false;
        emotional_score = 0.0;
        profit_result = 0.0;
        negotiation_rounds = 0;
        dominant_agent = "";
        agreement_level = 0.0;
        profit_points = 0.0;
        duration_bars = 0;
        max_favorable_excursion = 0.0;
        max_adverse_excursion = 0.0;

        for(int i = 0; i < 5; i++) {
            participating_agents[i] = "";
            agent_confidences[i] = 0.0;
            agent_votes[i] = VOTE_NEUTRAL;
        }
    }
};

//+------------------------------------------------------------------+
//| Estructura de Resultado de Consenso Neural                      |
//+------------------------------------------------------------------+
struct NeuralConsensusResult {
    ENUM_VOTE_DIRECTION final_direction;
    double consensus_strength;
    double total_conviction;
    double negotiation_rounds;
    string consensus_reasoning;
    bool strong_consensus;
    int dissenting_agents;
    string leading_agent;
    double leadership_strength;
    bool veto_used;
    ulong consensus_id;
    MarketEmotion market_emotion;

    void Initialize() {
        final_direction = VOTE_NEUTRAL;
        consensus_strength = 0.0;
        total_conviction = 0.0;
        negotiation_rounds = 0;
        consensus_reasoning = "";
        strong_consensus = false;
        dissenting_agents = 0;
        leading_agent = "";
        leadership_strength = 0.0;
        veto_used = false;
        consensus_id = 0;
        market_emotion.Initialize();
    }
};

//+------------------------------------------------------------------+
//| Estructura de Contexto de Decisión                              |
//+------------------------------------------------------------------+
struct DecisionContext {
    datetime timestamp;
    double atr;
    double momentum;
    double volatility;
    int session;
    double market_strength;
    bool high_confidence;
    string context_description;

    void Initialize() {
        timestamp = 0;
        atr = 0.0;
        momentum = 0.0;
        volatility = 0.0;
        session = 0;
        market_strength = 0.0;
        high_confidence = false;
        context_description = "";
    }
};

#endif // COMMON_STRUCTURES_MQH

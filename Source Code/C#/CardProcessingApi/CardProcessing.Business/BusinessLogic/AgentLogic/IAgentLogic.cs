﻿using System.Collections.Generic;
using CardProcessingApi.Data;

namespace CardProcessing.Business.BusinessLogic.AgentLogic
{
    public interface IAgentLogic
    {
        CardProcessingApi.Data.Agent GetAgentById(int agentId);
        void Add(Agent agent);

        void Update(Agent agent);
        List<Agent> GetAll();
        List<Agent> SearchAgent(int id, string name);
    }
}

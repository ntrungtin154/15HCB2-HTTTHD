﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using CardProcessingApi.Data;
using CardProcessingApi.DataAccess;

namespace CardProcessing.Business.BusinessLogic.AgentLogic
{
    public class AgentLogic:IAgentLogic
    {
        private readonly IGenericRepository<Agent> _agentRepository;
        private readonly IUnitOfWork _unitOfWork;
        

        public AgentLogic(IGenericRepository<Agent> agentRepository, IUnitOfWork unitOfWork)
        {
            this._agentRepository = agentRepository;
            _unitOfWork = unitOfWork;
        }

        public Agent GetAgentById(int agentId)
        {
            return _agentRepository.TableTracking.FirstOrDefault(c => c.AgentId == agentId);
        }

        public void Add(Agent agent)
        {
            _agentRepository.Add(agent);
            _unitOfWork.Commit();
        }

        public void Update(Agent agent)
        {
            if (_agentRepository.GetById(agent.AgentId) != null)
            {
                _agentRepository.Update(agent);
                _unitOfWork.Commit();
            }
        }

        public List<Agent> GetAll()
        {
            return _agentRepository.TableNoTracking.IncludeTable(c => c.District).IncludeTable(c => c.Province).ToList();
        }

        public List<Agent> SearchAgent(int id, string name)
        {
            return _agentRepository.GetAll().Where( n => (n.AgentId == id || id == 0) && (n.AgentName.Contains(name) || name == "")).ToList();
        }
    }
}

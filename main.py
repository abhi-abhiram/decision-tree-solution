from typing import Union
from solution import getSolutionContext
from solution import llm_chain

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/solution")
def solution_for_incident(query: str, company: str):
    context = getSolutionContext()
    return llm_chain.run(context=context, query=query, company=company)

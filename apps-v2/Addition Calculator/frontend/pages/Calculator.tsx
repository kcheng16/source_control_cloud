import { useState } from 'react'
import { Plus, Minus, X, Divide, Equal, Calculator as CalculatorIcon } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '../lib/shadcn/card'
import { Input } from '../lib/shadcn/input'
import { Button } from '../lib/shadcn/button'

type Operation = 'add' | 'subtract' | 'multiply' | 'divide'

const OPS: Record<Operation, { icon: typeof Plus; label: string }> = {
  add: { icon: Plus, label: 'Add' },
  subtract: { icon: Minus, label: 'Subtract' },
  multiply: { icon: X, label: 'Multiply' },
  divide: { icon: Divide, label: 'Divide' },
}

export default function Calculator() {
  const [a, setA] = useState('')
  const [b, setB] = useState('')
  const [operation, setOperation] = useState<Operation>('add')
  const [result, setResult] = useState<number | null>(null)
  const [error, setError] = useState<string | null>(null)

  const numA = parseFloat(a)
  const numB = parseFloat(b)
  const canCompute = !isNaN(numA) && !isNaN(numB)

  const handleCompute = () => {
    if (!canCompute) return
    setError(null)
    if (operation === 'add') setResult(numA + numB)
    else if (operation === 'subtract') setResult(numA - numB)
    else if (operation === 'multiply') setResult(numA * numB)
    else if (numB === 0) {
      setResult(null)
      setError('Cannot divide by zero')
    } else setResult(numA / numB)
  }

  const OpIcon = OPS[operation].icon
  const opLabel = OPS[operation].label

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-background p-6 gap-6">
      <div className="flex items-center gap-3">
        <div className="flex items-center justify-center w-11 h-11 rounded-xl bg-primary text-primary-foreground shadow-retool-sm">
          <CalculatorIcon className="w-6 h-6" />
        </div>
        <span className="text-2xl font-bold tracking-tight text-foreground">QuickCalc</span>
      </div>
      <Card className="w-full max-w-sm">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <OpIcon className="w-5 h-5 text-primary" />
            Calculator
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-4 gap-2">
            {(Object.keys(OPS) as Operation[]).map((op) => {
              const Icon = OPS[op].icon
              return (
                <Button
                  key={op}
                  variant={operation === op ? 'default' : 'outline'}
                  onClick={() => setOperation(op)}
                  aria-label={OPS[op].label}
                >
                  <Icon className="w-4 h-4" />
                </Button>
              )
            })}
          </div>

          <div className="space-y-2">
            <Input
              type="number"
              placeholder="First number"
              value={a}
              onChange={(e) => setA(e.target.value)}
            />
            <div className="flex justify-center">
              <OpIcon className="w-5 h-5 text-muted-foreground" />
            </div>
            <Input
              type="number"
              placeholder="Second number"
              value={b}
              onChange={(e) => setB(e.target.value)}
            />
          </div>

          <Button className="w-full" onClick={handleCompute} disabled={!canCompute}>
            <Equal className="w-4 h-4 mr-2" />
            {opLabel}
          </Button>

          {error && (
            <div className="text-center p-4 rounded-md bg-destructive/10 text-destructive text-sm font-medium">
              {error}
            </div>
          )}

          {result !== null && (
            <div className="text-center p-4 rounded-md bg-muted">
              <p className="text-sm text-muted-foreground">Result</p>
              <p className="text-3xl font-bold text-foreground">{result}</p>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}

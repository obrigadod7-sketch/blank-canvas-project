import * as React from "react";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader } from "@/components/ui/card";

const Index = React.forwardRef<HTMLDivElement>((_props, ref) => {
  return (
    <div ref={ref} className="min-h-screen bg-background text-foreground">
      <main className="container flex min-h-screen items-center justify-center py-10">
        <Card className="w-full max-w-xl">
          <CardHeader>
            <h1 className="text-balance text-3xl font-semibold leading-none tracking-tight">
              Projeto em branco (simples)
            </h1>
          </CardHeader>
          <CardContent className="space-y-5">
            <p className="text-muted-foreground">
              Este é um ponto de partida minimalista. Você pode começar editando o arquivo:
            </p>

            <pre className="overflow-x-auto rounded-md border bg-card p-3 text-sm">
              <code>src/pages/Index.tsx</code>
            </pre>

            <div className="flex flex-wrap gap-3">
              <Button asChild>
                <a href="https://docs.lovable.dev/" target="_blank" rel="noreferrer">
                  Ver documentação
                </a>
              </Button>
              <Button variant="secondary" onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}>
                Voltar ao topo
              </Button>
            </div>
          </CardContent>
        </Card>
      </main>
    </div>
  );
});
Index.displayName = "Index";

export default Index;

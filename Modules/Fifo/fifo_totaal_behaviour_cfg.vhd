configuration fifo_totaal_behaviour_cfg of fifo_totaal is
   for behaviour
      for all: fifo use configuration work.fifo_behaviour_cfg;
      end for;
      for all: ram use configuration work.ram_behaviour_cfg;
      end for;
   end for;
end fifo_totaal_behaviour_cfg;



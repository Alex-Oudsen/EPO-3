configuration tb_fifo_ctr_behaviour_cfg of tb_fifo_ctr is
   for behaviour
      for all: fifo use configuration work.fifo_behaviour_cfg;
      end for;
   end for;
end tb_fifo_ctr_behaviour_cfg;



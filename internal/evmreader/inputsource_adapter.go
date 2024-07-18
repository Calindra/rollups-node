// (c) Cartesi and individual authors (see AUTHORS)
// SPDX-License-Identifier: Apache-2.0 (see LICENSE)

package evmreader

import (
	"math/big"

	"github.com/cartesi/rollups-node/pkg/contracts/inputbox"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/ethclient"
)

type (
	InputBox = inputbox.InputBox
)

// InputBox Wrapper
type InputSourceAdapter struct {
	inputbox *InputBox
}

func NewInputSourceAdapter(
	inputBoxAddress Address,
	client *ethclient.Client,
) (*InputSourceAdapter, error) {
	inputbox, err := inputbox.NewInputBox(inputBoxAddress, client)
	if err != nil {
		return nil, err
	}
	return &InputSourceAdapter{
		inputbox: inputbox,
	}, nil
}

func (i *InputSourceAdapter) RetrieveInputs(
	opts *bind.FilterOpts,
	appContract []Address,
	index []*big.Int,
) ([]InputBoxInputAdded, error) {

	itr, err := i.inputbox.FilterInputAdded(opts, appContract, index)
	if err != nil {
		return nil, err
	}
	defer itr.Close()

	var events []InputBoxInputAdded
	for itr.Next() {
		inputAddedEvent := itr.Event
		events = append(events, *inputAddedEvent)
	}
	err = itr.Error()
	if err != nil {
		return nil, err
	}
	return events, nil
}

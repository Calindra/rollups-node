// (c) Cartesi and individual authors (see AUTHORS)
// SPDX-License-Identifier: Apache-2.0 (see LICENSE)

package retrypolicy

import (
	"log/slog"
	"time"
)

// Implements a simple method call retry policy.
// This retry policy will retry a failed execution for up to 'maxRetries' times
// In between retry calls it will wait a "maxDelay"
func CallFunctionWithRetryPolicy[
	R any,
	A any,
](
	fn func(A) (R, error),
	args A,
	maxRetries uint,
	maxDelay time.Duration,
	infoLabel string,
) (R, error) {

	var lastErr error
	var lastValue R

	for i := uint(0); i <= maxRetries; i++ {
		lastValue, lastErr = fn(args)
		if lastErr == nil {
			return lastValue, nil
		}
		slog.Info(
			"Retry Policy: Got error calling function",
			"label",
			infoLabel,
			"error",
			lastErr.Error())
		slog.Info("Retry Policy: Retrying...", "delay", maxDelay)

		time.Sleep(maxDelay)
	}
	return lastValue, lastErr

}
